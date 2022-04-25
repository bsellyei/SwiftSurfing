//
//  Couch.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 15..
//

import Foundation
import Firebase

class Couch: Identifiable {
    let ref: DatabaseReference?
    var id: String
    var userId: String
    var name: String
    var latitude: Double
    var longitude: Double
    var address: String
    var city: String
    var country: String
    var maxGuests: Int
    var description: String
    var imageURLs: [String]
    var tags: String
    
    var ratingAverage: Int
    var ratingCount: Int
 
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.userId = ""
        self.name = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.address = ""
        self.city = ""
        self.country = ""
        self.maxGuests = -1
        self.description = ""
        self.imageURLs = ["placeholder"]
        self.tags = ""
        
        self.ratingAverage = 0
        self.ratingCount = 0
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let userId = value["userId"] as? String,
            let name = value["name"] as? String,
            let latitude = value["latitude"] as? Double,
            let longitude = value["longitude"] as? Double,
            let address = value["address"] as? String,
            let city = value["city"] as? String,
            let country = value["country"] as? String,
            let maxGuests = value["maxGuests"] as? Int,
            let description = value["description"] as? String,
            let imageURLs = value["imageURLs"] as? [String],
            let tags = value["tags"] as? String,
            let ratingAverage = value["ratingAverage"] as? Int,
            let ratingCount = value["ratingCount"] as? Int
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.userId = userId
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.city = city
        self.country = country
        self.maxGuests = maxGuests
        self.description = description
        self.imageURLs = imageURLs
        self.tags = tags
        
        self.ratingAverage = ratingAverage
        self.ratingCount = ratingCount
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "userId": userId,
            "name": name,
            "latitude": latitude,
            "longitude": longitude,
            "address": address,
            "city": city,
            "country": country,
            "maxGuests": maxGuests,
            "description": description,
            "imageURLs": imageURLs,
            "tags": tags,
            "ratingAverage": ratingAverage,
            "ratingCount": ratingCount
        ]
    }
}
