//
//  JobTests.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 11..
//

@testable import App
import XCTVapor
import SwiftyMocky

let weatherService = IWeatherServiceMock()

final class JobTests: XCTestCase {
    var app: Application!
    
    var homeConfigurationService: IHomeConfigurationService!
    var homeService: IHomeService!
    var couchService: ICouchService!
    
    override func setUpWithError() throws {
        app = try Application.testable()
        
        homeConfigurationService = HomeConfigurationService(db: app.db)
        couchService = CouchService(db: app.db)
        homeService = HomeService(homeConfigurationService: homeConfigurationService,
                                  externalHomeService: externalHomeService)
        
        try app.register(collection: HomeController(homeService: homeService))
        
        let weatherWatcherJob = WeatherWatcherJob(homeConfigurationService: homeConfigurationService,
                                                  couchService: couchService)
        
        app.queues.add(weatherWatcherJob)
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testWeatherWatcherHeatingTurningOn() async throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .weatherWatcher, itemNames: [], state: .on, on: app.db)
        let heating = try HomeConfiguration.create(couch: couch, type: .heating, itemNames: [], state: .off, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .cooling, itemNames: [], state: .off, on: app.db)
        
        Given(weatherService, .getWeather(cityName: "Budapest", willReturn: 10))
        
        let weatherJob = WeatherJob(weatherService: weatherService,
                                    homeConfigurationService: homeConfigurationService,
                                    couchService: couchService)
        
        try await weatherJob.run(context: app.queues.queue.context)
        try app.queues.queue.worker.run().wait()
        
        try app.test(.GET, "/home/item/\(heating.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, heating.id)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .on)
        })
    }
    
    func testWeatherWatcherHeatingTurningOff() async throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .weatherWatcher, itemNames: [], state: .on, on: app.db)
        let heating = try HomeConfiguration.create(couch: couch, type: .heating, itemNames: [], state: .on, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .cooling, itemNames: [], state: .off, on: app.db)
        
        Given(weatherService, .getWeather(cityName: "Budapest", willReturn: 30))
        
        let weatherJob = WeatherJob(weatherService: weatherService,
                                    homeConfigurationService: homeConfigurationService,
                                    couchService: couchService)
        
        try await weatherJob.run(context: app.queues.queue.context)
        try app.queues.queue.worker.run().wait()
        
        try app.test(.GET, "/home/item/\(heating.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, heating.id)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .off)
        })
    }
    
    func testWeatherWatcherCoolingTurningOn() async throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .weatherWatcher, itemNames: [], state: .on, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .heating, itemNames: [], state: .off, on: app.db)
        let cooling = try HomeConfiguration.create(couch: couch, type: .cooling, itemNames: [], state: .off, on: app.db)
        
        Given(weatherService, .getWeather(cityName: "Budapest", willReturn: 30))
        
        let weatherJob = WeatherJob(weatherService: weatherService,
                                    homeConfigurationService: homeConfigurationService,
                                    couchService: couchService)
        
        try await weatherJob.run(context: app.queues.queue.context)
        try app.queues.queue.worker.run().wait()
        
        try app.test(.GET, "/home/item/\(cooling.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, cooling.id)
            XCTAssertEqual(configuration.type, .cooling)
            XCTAssertEqual(configuration.state, .on)
        })
    }
    
    func testWeatherWatcherCoolingTurningOff() async throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .weatherWatcher, itemNames: [], state: .on, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .heating, itemNames: [], state: .off, on: app.db)
        let cooling = try HomeConfiguration.create(couch: couch, type: .cooling, itemNames: [], state: .on, on: app.db)
        
        Given(weatherService, .getWeather(cityName: "Budapest", willReturn: 10))
        
        let weatherJob = WeatherJob(weatherService: weatherService,
                                    homeConfigurationService: homeConfigurationService,
                                    couchService: couchService)
        
        try await weatherJob.run(context: app.queues.queue.context)
        try app.queues.queue.worker.run().wait()
        
        try app.test(.GET, "/home/item/\(cooling.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, cooling.id)
            XCTAssertEqual(configuration.type, .cooling)
            XCTAssertEqual(configuration.state, .off)
        })
    }
}
