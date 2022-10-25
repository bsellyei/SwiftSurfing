//
//  CouchServiceTests.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

@testable import App
import XCTVapor
import Foundation
import SwiftyMocky

let couchName = "Supreme Store"
let address = "2-3 Peter St"
let city = "London"
let country = "United Kingdom"
let latitude = 51.51290774880793
let longitude = -0.13393321581721043
let maxGuests = 5

final class CouchServiceTests: XCTestCase {
    
    override func setUp() {
        setUpEnvironment()
    }
    
    func testGetAllCouchesEmpty() async throws {
        /*let couchServiceMock = ICouchServiceMock()
        
        Given(couchServiceMock, .getAllCouches(willReturn: []))
        XCTAssertEqual(try couchServiceMock.getAllCouches().count, 0)*/
    }
    
    func testGetAllUsers() async throws {
        /*let couchServiceMock = ICouchServiceMock()
        let user1 = User(fullName: "user1", email: "user1@test.com")
        let couch1 = Couch(userId: user1.id!, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests)
        
        let user2 = User(fullName: "user2", email: "user2@test.com")
        let couch2 = Couch(userId: user2.id!, address: address, city: city, country: country, latitude: latitude, longitude: longitude, maxGuests: maxGuests)
        
        Given(couchServiceMock, .getAllCouches(willReturn: [couch1]))
        var couches = try couchServiceMock.getAllCouches()
        XCTAssertEqual(couches.count, 1)
        XCTAssertEqual(couches[0].$user.id, couch1.$user.id)
        XCTAssertEqual(couches[0].name, couchName)
        XCTAssertEqual(couches[0].address, address)
        XCTAssertEqual(couches[0].city, city)
        XCTAssertEqual(couches[0].country, country)
        XCTAssertEqual(couches[0].latitude, latitude)
        XCTAssertEqual(couches[0].longitude, longitude)
        XCTAssertEqual(couches[0].maxGuests, maxGuests)
        
        Given(couchServiceMock, .getAllCouches(willReturn: [couch1, couch2]))
        couches = try couchServiceMock.getAllCouches()
        XCTAssertEqual(couches.count, 2)
        XCTAssertEqual(couches[1].$user.id, couch2.$user.id)
        XCTAssertEqual(couches[1].name, couchName)
        XCTAssertEqual(couches[1].address, address)
        XCTAssertEqual(couches[1].city, city)
        XCTAssertEqual(couches[1].country, country)
        XCTAssertEqual(couches[1].latitude, latitude)
        XCTAssertEqual(couches[1].longitude, longitude)
        XCTAssertEqual(couches[1].maxGuests, maxGuests)*/
    }
    
    func setUpEnvironment() {
        Matcher.default.register(User.self) { (lhs, rhs) -> Bool in
            guard lhs.id == rhs.id else { return false }
            guard lhs.fullName == rhs.fullName else { return false }
            guard lhs.email == rhs.email else { return false }
            return true
        }
    }
}
