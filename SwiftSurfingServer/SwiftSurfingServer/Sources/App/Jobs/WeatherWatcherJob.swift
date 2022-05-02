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
            let couches = try await couchService.getAllCouchesByCity(city: city, userId: nil)
            for couch in couches {
                if couch.isWeatherWatcherOn() {
                    if weather <= 15 && !couch.isHeatingOn() || weather > 15 && couch.isHeatingOn() {
                        _ = try await homeConfigurationService.switchState(id: couch.getHeatingId())
                    } else if weather >= 27 && !couch.isCoolingOn() || weather < 27 && couch.isCoolingOn() {
                        _ = try await homeConfigurationService.switchState(id: couch.getCoolingId())
                    }
                }
            }
        }
    }
}
