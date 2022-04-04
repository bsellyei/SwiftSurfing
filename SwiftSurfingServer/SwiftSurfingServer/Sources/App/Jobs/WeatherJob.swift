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
    
    init(weatherService: IWeatherService) {
        self.weatherService = weatherService
    }
    
    func run(context: QueueContext) async throws {
        let weatherResponse = try await weatherService.getWeather(cityName: "Budapest")
        print("Weather in Budapest is \(weatherResponse)")
    }
}
