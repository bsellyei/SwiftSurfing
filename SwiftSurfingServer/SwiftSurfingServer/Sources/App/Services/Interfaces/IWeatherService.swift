//
//  IWeatherService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 01..
//

import Foundation

//sourcery: AutoMockable
protocol IWeatherService {
    func getWeather(cityName: String) async throws -> Int
}
