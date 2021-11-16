//
//  Models+Testable.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

@testable import App
import Fluent

extension User {
    static func create(fullName: String = "Luke", email: String = "luke@test.com", on database: Database) throws -> User {
        let user = User(fullName: fullName, email: email)
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
