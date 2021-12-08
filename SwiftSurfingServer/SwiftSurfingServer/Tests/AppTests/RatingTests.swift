//
//  RatingTests.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 23..
//

@testable import App
import XCTVapor

final class RatingTests: XCTestCase {
    let ratingValue = 3
    let ratingComment = ""
    let ratingsURI = "/ratings/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetRatings() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(on: app.db)
        let rating1 = try Rating.create(user: user1, couch: couch1, value: ratingValue, comment: ratingComment, on: app.db)
        _ = try Rating.create(on: app.db)
        
        try app.test(.GET, "\(ratingsURI)\(couch1.id!)", afterResponse: { response in
            let ratings = try response.content.decode([Rating].self)
            
            XCTAssertEqual(ratings.count, 1)
            XCTAssertEqual(ratings[0].id, rating1.id)
            XCTAssertEqual(ratings[0].$user.id, rating1.$user.id)
            XCTAssertEqual(ratings[0].$couch.id, rating1.$couch.id)
            XCTAssertEqual(ratings[0].value, rating1.value)
            XCTAssertEqual(ratings[0].comment, rating1.comment)
        })
    }
    
    func testCreateRating() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(on: app.db)
        let rating1 = CreateRatingData(userId: user1.id!, couchId: couch1.id!, value: ratingValue, comment: ratingComment)
        
        try app.test(.POST, ratingsURI, beforeRequest: { request in
            try request.content.encode(rating1)
        }, afterResponse: { response in
            let rating = try response.content.decode(Rating.self)
            
            XCTAssertNotNil(rating.id)
            XCTAssertEqual(rating.$user.id, rating1.userId)
            XCTAssertEqual(rating.$couch.id, rating1.couchId)
            XCTAssertEqual(rating.value, rating1.value)
            XCTAssertEqual(rating.comment, rating1.comment)
        })
    }
    
    func testDeleteRating() throws {
        let user1 = try User.create(on: app.db)
        let couch1 = try Couch.create(on: app.db)
        let rating1 = try Rating.create(user: user1, couch: couch1, value: ratingValue, comment: ratingComment, on: app.db)
        
        try app.test(.GET, "\(ratingsURI)\(couch1.id!)", afterResponse: { response in
            let ratings = try response.content.decode([Rating].self)
            
            XCTAssertEqual(ratings.count, 1)
        })
        
        try app.test(.DELETE, "\(ratingsURI)\(rating1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(ratingsURI)\(couch1.id!)", afterResponse: { response in
            let ratings = try response.content.decode([Rating].self)
            
            XCTAssertEqual(ratings.count, 0)
        })
    }
}
