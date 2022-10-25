//
//  Models+Testable.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

@testable import App
import Vapor
import Fluent
import Foundation

extension User {
    static func create(fullName: String = "Luke", email: String = "luke@test.com", on database: Database) throws -> User {
        let user = User(fullName: fullName, email: email, externalId: "ext")
        try user.save(on: database).wait()
        return user
    }
}

extension Couch {
    static func create(user: User? = nil, name: String = "Teszt ház", address: String = "Teszt utca 4", city: String = "Budapest", country: String = "Hungary",
                       latitude: Double = 47.497913, longitude: Double = 19.040236, maxGuests: Int = 3,
                       on database: Database) throws -> Couch {
        var couchOwner = user
        
        if couchOwner == nil {
            couchOwner = try User.create(on: database)
        }
        
        let couch = Couch(
            userId: couchOwner!.id!,
            name: name,
            address: address,
            city: city,
            country: country,
            latitude: latitude,
            longitude: longitude,
            maxGuests: maxGuests)
        try couch.save(on: database).wait()
        return couch
    }
}

extension Rating {
    static func create(user: User? = nil, couch: Couch? = nil, value: Int = 5, comment: String = "Such a nice place!", on database: Database) throws -> Rating {
        var ratingOwner = user
        var couchToRate = couch
        
        if ratingOwner == nil {
            ratingOwner = try User.create(on: database)
        }
        
        if couchToRate == nil {
            couchToRate = try Couch.create(on: database)
        }
        
        let rating = Rating(userId: ratingOwner!.id!, couchId: couchToRate!.id!, value: value, comment: comment)
        try rating.save(on: database).wait()
        return rating
    }
}

extension Conversation {
    static func create(fromUser: User? = nil, toUser: User? = nil, on database: Database) throws -> Conversation {
        var from = fromUser
        var to = toUser
        
        if from == nil {
            from = try User.create(on: database)
        }
        
        if to == nil {
            to = try User.create(on: database)
        }
        
        let conversation = Conversation()
        try conversation.save(on: database).wait()
        _ = conversation.$users.attach([from!, to!], on: database)
        return conversation
    }
}

extension Message {
    static func create(user: User? = nil, conversation: Conversation? = nil, text: String = "Hi there!", on database: Database) throws -> Message {
        var sender = user
        var convo = conversation
        
        if sender == nil {
            sender = try User.create(on: database)
        }
        
        if convo == nil {
            convo = try Conversation.create(on: database)
        }
        
        let message = Message(userId: user!.id!, conversationId: conversation!.id!, text: text, date: Date())
        try message.save(on: database).wait()
        return message
    }
}

extension Reservation {
    static func create(user: User? = nil, couch: Couch? = nil, guestsNum: Int = 2, start: Date = Date(), end: Date = Date(), on database: Database) throws -> Reservation {
        var guest = user
        var home = couch
        
        if guest == nil {
            guest = try User.create(on: database)
        }
        
        if home == nil {
            home = try Couch.create(on: database)
        }
        
        let endDate = Calendar.current.date(byAdding: .day, value: 7, to: start)
        let reservation = Reservation(guestId: guest!.id!, couchId: couch!.id!, guestsNum: guestsNum, start: start, end: endDate!)
        try reservation.save(on: database).wait()
        return reservation
    }
}

extension HomeConfiguration {
    static func create(couch: Couch? = nil, type: ConfigurationType = .heating, state: State = .off, on database: Database) throws -> HomeConfiguration {
        var place = couch
        if place == nil {
            place = try Couch.create(on: database)
        }
        
        let configuration = HomeConfiguration(couchId: place!.id!, name: "homeConfiguration", type: type, state: state)
        try configuration.save(on: database).wait()
        return configuration
    }
}
