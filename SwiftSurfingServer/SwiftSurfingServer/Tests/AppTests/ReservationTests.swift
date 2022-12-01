//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 02..
//

@testable import App
import XCTVapor

final class ReservationTests: XCTestCase {
    let reservationsURI = "/reservations/"
    let conversationsURI = "/conversations/"
    let messagesURI = "/messages/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testCreateReservation() throws {
        let guest = try User.create(on: app.db)
        let couch = try Couch.create(on: app.db)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date1 = formatter.date(from: "2022/05/02")
        let date2 = formatter.date(from: "2022/05/09")
        
        let createData = CreateReservationData(guestId: guest.id!, couchId: couch.id!, guestsNum: 2, start: "2022/05/02", end: "2022/05/09")
        try app.test(.POST, reservationsURI, beforeRequest: { request in
            try request.content.encode(createData)
        }, afterResponse: { response in
            let reservation = try response.content.decode(Reservation.self)
            
            XCTAssertNotNil(reservation.id)
            XCTAssertEqual(reservation.$user.id, guest.id)
            XCTAssertEqual(reservation.$couch.id, couch.id)
            XCTAssertEqual(reservation.guestsNum, 2)
            XCTAssertEqual(reservation.start, date1)
            XCTAssertEqual(reservation.end, date2)
        })
        
        var conversationId = ""
        try app.test(.GET, "\(conversationsURI)\(guest.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 1)
            if conversations.count > 0 {
                conversationId = conversations[0].id!.uuidString
            }
        })
        
        try app.test(.GET, "\(messagesURI)\(conversationId)", afterResponse: { response in
            let messages = try response.content.decode([Message].self)
            
            XCTAssertEqual(messages.count, 1)
            XCTAssertEqual(messages[0].$user.id, guest.id)
        })
    }
    
    func testGetReservationForUser() throws {
        let guest = try User.create(on: app.db)
        let couch1 = try Couch.create(on: app.db)
        let couch2 = try Couch.create(on: app.db)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date1 = formatter.date(from: "2022/05/10")
        let date2 = formatter.date(from: "2022/05/13")
        
        let reservation1 = try Reservation.create(user: guest, couch: couch1, guestsNum: 2, start: date1!, end: date2!, on: app.db)
        let reservation2 = try Reservation.create(user: guest, couch: couch2, guestsNum: 2, start: date1!, end: date2!, on: app.db)
        
        try app.test(.GET, "\(reservationsURI)user/\(guest.id!)", afterResponse: { response in
            let reservations = try response.content.decode([Reservation].self)
            
            XCTAssertEqual(reservations.count, 2)
            
            XCTAssertEqual(reservations[0].start, reservation1.start)
            XCTAssertEqual(reservations[1].start, reservation2.start)
        })
    }
    
    func testGetReservationsForCouch() throws {
        let guest = try User.create(on: app.db)
        let couch1 = try Couch.create(on: app.db)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date1 = formatter.date(from: "2022/05/10")
        let date2 = formatter.date(from: "2022/05/13")
        let reservation1 = try Reservation.create(user: guest, couch: couch1, guestsNum: 2, start: date1!, end: date2!, on: app.db)
        
        let date3 = formatter.date(from: "2022/05/18")
        let date4 = formatter.date(from: "2022/05/20")
        let reservation2 = try Reservation.create(user: guest, couch: couch1, guestsNum: 2, start: date3!, end: date4!, on: app.db)
        
        try app.test(.GET, "\(reservationsURI)\(couch1.id!)", afterResponse: { response in
            let reservations = try response.content.decode([Reservation].self)
            
            XCTAssertEqual(reservations.count, 2)
            
            XCTAssertEqual(reservations[0].start, reservation1.start)
            XCTAssertEqual(reservations[1].start, reservation2.start)
        })
    }
}