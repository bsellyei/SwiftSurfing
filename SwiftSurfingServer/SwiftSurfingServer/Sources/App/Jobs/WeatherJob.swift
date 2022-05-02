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
    
    init(weatherService: IWeatherService, homeConfigurationService: IHomeConfigurationService) {
        self.weatherService = weatherService
        self.homeConfigurationService = homeConfigurationService
    }
    
    func run(context: QueueContext) async throws {
        let configurations = try await homeConfigurationService.getHomeConfigurationsByType(type: .weatherWatcher, state: .on)
        var dictionary = [String:Int]()
        for config in configurations {
            if dictionary[config.couch.city] != nil {
                continue
            }
            
            dictionary[config.couch.city] = try await weatherService.getWeather(cityName: config.couch.city)
        }
        
        //context.queue.dispatch()
    }
}
