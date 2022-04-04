//
//  WeatherService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 01..
//

import Foundation
import Vapor

class WeatherService: IWeatherService {
    let apiKey = "75cdf0e9bdd16533f6b50e1a5c64e661"
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
    
    let httpClient: Client
    
    init(httpClient: Client) {
        self.httpClient = httpClient
    }
    
    func getWeather(cityName: String) async throws -> Int {
        let uri = URI(string: "\(baseUrl)q=\(cityName)&units=metric&APPID=\(apiKey)")
        
        let response = try await httpClient.get(uri)
        let weather: Weather = try decodeClientResponse(response: response)
        
        let temperature = weather.main!.temp!.rounded()
        return Int(temperature)
    }
    
    private func decodeClientResponse<T: Decodable>(response: ClientResponse) throws -> T {
        guard response.status == .ok else { throw Abort(.unauthorized) }
        guard let buffer = response.body else { throw Abort(.badRequest) }
        guard let data = String(buffer: buffer).data(using: .utf8) else { throw Abort(.badRequest) }
        
        let decoder: JSONDecoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw Abort(.badRequest)
        }
    }
}
