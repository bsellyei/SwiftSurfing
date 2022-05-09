//
//  HomeTests.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

@testable import App
import XCTVapor
import Foundation

final class HomeTests: XCTestCase {
    let homeURI = "/home/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetHomeConfigurations() throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .heating, state: .off, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .cooling, state: .off, on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .weatherWatcher, state: .off, on: app.db)
        
        try app.test(.GET, "\(homeURI)items/\(couch.id!)", afterResponse: { response in
            let configurations = try response.content.decode([HomeConfiguration].self)
            
            XCTAssertEqual(configurations.count, 3)
            XCTAssertEqual(configurations[0].type, .heating)
            XCTAssertEqual(configurations[1].type, .cooling)
            XCTAssertEqual(configurations[2].type, .weatherWatcher)
        })
    }
}
