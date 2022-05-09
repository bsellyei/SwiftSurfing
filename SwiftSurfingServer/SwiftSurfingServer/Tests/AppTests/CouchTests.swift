//
//  CouchTests.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

@testable import App
import XCTVapor

final class CouchTests: XCTestCase {
    let couchName = "Supreme Store"
    let address = "2-3 Peter St"
    let city = "London"
    let country = "United Kingdom"
    let latitude = 51.51290774880793
    let longitude = -0.13393321581721043
    let maxGuests = 5
    let couchesURI = "/couches/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetAllCouches() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(user: user1, name: couchName, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests, on: app.db)
        
        try app.test(.GET, "\(couchesURI)user/\(user1.id!)", afterResponse: { response in
            let couches = try response.content.decode([Couch].self)
            
            XCTAssertEqual(couches.count, 1)
            XCTAssertEqual(couches[0].id, couch1.id)
            XCTAssertEqual(couches[0].$user.id, couch1.$user.id)
            XCTAssertEqual(couches[0].name, couchName)
            XCTAssertEqual(couches[0].address, address)
            XCTAssertEqual(couches[0].city, city)
            XCTAssertEqual(couches[0].country, country)
            XCTAssertEqual(couches[0].latitude, latitude)
            XCTAssertEqual(couches[0].longitude, longitude)
            XCTAssertEqual(couches[0].maxGuests, maxGuests)
        })
    }
    
    func testGetSingleCouch() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(user: user1, name: couchName, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests, on: app.db)
        
        try app.test(.GET, "\(couchesURI)\(couch1.id!)", afterResponse: { response in
            let couch = try response.content.decode(Couch.self)
            
            XCTAssertEqual(couch.id, couch1.id)
            XCTAssertEqual(couch.$user.id, couch1.$user.id)
            XCTAssertEqual(couch.name, couchName)
            XCTAssertEqual(couch.address, address)
            XCTAssertEqual(couch.city, city)
            XCTAssertEqual(couch.country, country)
            XCTAssertEqual(couch.latitude, latitude)
            XCTAssertEqual(couch.longitude, longitude)
            XCTAssertEqual(couch.maxGuests, maxGuests)
        })
    }
    
    func testCreateCouch() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = CreateCouchData(userId: user1.id!, name: couchName, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests, description: "")
        
        var couchId = UUID()
        
        try app.test(.POST, couchesURI, beforeRequest: { request in
            try request.content.encode(couch1)
        }, afterResponse: { response in
            let couch = try response.content.decode(Couch.self)
            
            XCTAssertNotNil(couch.id)
            XCTAssertEqual(couch.$user.id, couch1.userId)
            XCTAssertEqual(couch.name, couchName)
            XCTAssertEqual(couch.address, address)
            XCTAssertEqual(couch.city, city)
            XCTAssertEqual(couch.country, country)
            XCTAssertEqual(couch.latitude, latitude)
            XCTAssertEqual(couch.longitude, longitude)
            XCTAssertEqual(couch.maxGuests, maxGuests)
            
            couchId = couch.id!
        })
        
        try app.test(.GET, "/home/items/\(couchId)", afterResponse: { response in
            let configurations = try response.content.decode([HomeConfiguration].self)
            
            XCTAssertEqual(configurations.count, 3)
            XCTAssertEqual(configurations[0].type, .heating)
            XCTAssertEqual(configurations[1].type, .cooling)
            XCTAssertEqual(configurations[2].type, .weatherWatcher)
        })
    }
    
    func testDeleteCouch() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(user: user1, name: couchName, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests, on: app.db)
        
        try app.test(.GET, "\(couchesURI)user/\(user1.id!)", afterResponse: { response in
            let couches = try response.content.decode([Couch].self)
            
            XCTAssertEqual(couches.count, 1)
        })
        
        try app.test(.DELETE, "\(couchesURI)\(couch1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(couchesURI)user/\(user1.id!)", afterResponse: { response in
            let couches = try response.content.decode([Couch].self)
            
            XCTAssertEqual(couches.count, 0)
        })
    }
}
