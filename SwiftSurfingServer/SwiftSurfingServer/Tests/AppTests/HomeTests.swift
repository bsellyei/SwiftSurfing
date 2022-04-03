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
    let homeURI = "/home"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetAllThings() throws {
        try app.test(.GET, "\(homeURI)/things", afterResponse: { response in
            XCTAssertEqual(response.status, .ok)
            
            let things = try response.content.decode([Thing].self)
            
            XCTAssertEqual(things.count, 0)
        })
    }
}
