//
//  JobTests.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 11..
//

@testable import App
import XCTVapor

final class JobTests: XCTestCase {
    func testWeatherWatcherHeatingTurningOn() throws {
        /*let app = Application(.testing)
        defer { app.shutdown() }*/
        
        /*let homeConfigurationService = IHomeConfigurationServiceMock()
        let couchService = ICouchServiceMock()
        app.queues.add(WeatherWatcherJob(homeConfigurationService: homeConfigurationService, couchService: couchService))
        try app.queues.startInProcessJobs()
        
        let cityWeatherDictionary = ["Budapest":12]
        app.get("bar") { req in
            req.queue.dispatch(WeatherWatcherJob.self, .init(cityWeatherDictionary: cityWeatherDictionary))
                .map { _ in "job bar dispatched" }
        }*/
    }
}
