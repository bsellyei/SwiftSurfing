//
//  Couch.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor
import Fluent

final class Couch: Model, Content {
    static let schema = "couches"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "userId")
    var user: User
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "address")
    var address: String
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "country")
    var country: String
    
    @Field(key: "latitude")
    var latitude: Double
    
    @Field(key: "longitude")
    var longitude: Double
    
    @Field(key: "maxGuests")
    var maxGuests: Int
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "imageUrls")
    var imageUrls: [String]
    
    @Field(key: "ratingAverage")
    var ratingAverage: Int
    
    @Field(key: "ratingCount")
    var ratingCount: Int
    
    @Children(for: \.$couch)
    var ratings: [Rating]
    
    @Children(for: \.$couch)
    var reservations: [Reservation]
    
    @Children(for: \.$couch)
    var configurations: [HomeConfiguration]
    
    init() {}
    
    init(id: UUID? = nil, userId: User.IDValue, name: String = "", address: String, city: String, country: String,
         latitude: Double, longitude: Double, maxGuests: Int, description: String = "") {
        self.id = id
        self.$user.id = userId
        self.name = name
        self.address = address
        self.city = city
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.maxGuests = maxGuests
        self.description = description
        self.imageUrls = []
        self.ratingAverage = 0
        self.ratingCount = 0
    }
}

extension Couch {
    func isHeatingOn() -> Bool {
        for config in configurations {
            if config.type == .heating && config.state == .on {
                return true
            }
        }
        
        return false
    }
    
    func isCoolingOn() -> Bool {
        for config in configurations {
            if config.type == .cooling && config.state == .on {
                return true
            }
        }
        
        return false
    }
    
    func isWeatherWatcherOn() -> Bool {
        for config in configurations {
            if config.type == .weatherWatcher && config.state == .on {
                return true
            }
        }
        
        return false
    }
    
    func getHeatingId() -> String? {
        for config in configurations {
            if config.type == .heating {
                return config.id?.uuidString
            }
        }
        
        return ""
    }
    
    func getCoolingId() -> String? {
        for config in configurations {
            if config.type == .cooling {
                return config.id?.uuidString
            }
        }
        
        return ""
    }
}
