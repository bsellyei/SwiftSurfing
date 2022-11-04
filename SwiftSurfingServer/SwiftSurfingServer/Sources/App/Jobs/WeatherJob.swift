//
//  WeatherJob.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 01..
//

import Foundation
import Vapor
import Queues

class WeatherJob: AsyncScheduledJob {
    let weatherService: IWeatherService
    let homeConfigurationService: IHomeConfigurationService
    let couchService: ICouchService
    
    init(weatherService: IWeatherService, homeConfigurationService: IHomeConfigurationService, couchService: ICouchService) {
        self.weatherService = weatherService
        self.homeConfigurationService = homeConfigurationService
        self.couchService = couchService
    }
    
    func run(context: QueueContext) async throws {
        let configurations = try await homeConfigurationService.getHomeConfigurationsByType(type: .weatherWatcher, state: .on)
        var dictionary = [String:Int]()
        for config in configurations {
            let configCouch = try await couchService.getCouch(id: config.$couch.id.uuidString)
            if let couch = configCouch {
                if dictionary[couch.city] != nil {
                    continue
                }
                
                dictionary[couch.city] = try await weatherService.getWeather(cityName: couch.city)
            }
        }
        
        try await context.queue.dispatch(WeatherWatcherJob.self, .init(cityWeatherDictionary: dictionary))
    }
}
