//
//  WeatherWatcherJob.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 08..
//

import Foundation
import Vapor
import Queues

struct WeatherWatcherConfig: Codable {
    let cityWeatherDictionary: [String:Int]
}

class WeatherWatcherJob: AsyncJob {
    typealias Payload = WeatherWatcherConfig
    
    let homeConfigurationService: IHomeConfigurationService
    let couchService: ICouchService
    
    init(homeConfigurationService: IHomeConfigurationService, couchService: ICouchService) {
        self.homeConfigurationService = homeConfigurationService
        self.couchService = couchService
    }
    
    func dequeue(_ context: QueueContext, _ payload: WeatherWatcherConfig) async throws {
        for (city, weather) in payload.cityWeatherDictionary {
            let couches = try await couchService.getAllCouchesByCity(city: city)
            for couch in couches {
                let homeConfigurations = try await homeConfigurationService.getHomeConfigurations(couchId: couch.id?.uuidString)
                
                if hasWeatherWatcherOn(configurations: homeConfigurations) {
                    let hasHeatingOn = hasHeatingOn(configurations: homeConfigurations)
                    let hasCoolingOn = hasCoolingOn(configurations: homeConfigurations)
                    
                    if weather <= 15 && !hasHeatingOn || weather > 15 && hasHeatingOn {
                        _ = try await homeConfigurationService.switchState(id: getHeatingId(configurations: homeConfigurations))
                    }
                    
                    if weather >= 27 && !hasCoolingOn || weather < 27 && hasCoolingOn {
                        _ = try await homeConfigurationService.switchState(id: getCoolingId(configurations: homeConfigurations))
                    }
                }
            }
        }
    }
    
    func hasWeatherWatcherOn(configurations: [HomeConfiguration]) -> Bool {
        return configurations.contains { $0.type == .weatherWatcher && $0.state == .on }
    }
    
    func hasHeatingOn(configurations: [HomeConfiguration]) -> Bool {
        return configurations.contains { $0.type == .heating && $0.state == .on }
    }
    
    func hasCoolingOn(configurations: [HomeConfiguration]) -> Bool {
        return configurations.contains { $0.type == .cooling && $0.state == .on }
    }
    
    func getHeatingId(configurations: [HomeConfiguration]) -> String? {
        return configurations.first { $0.type == .heating }?.id?.uuidString
    }
    
    func getCoolingId(configurations: [HomeConfiguration]) -> String? {
        return configurations.first { $0.type == .cooling }?.id?.uuidString
    }
}
