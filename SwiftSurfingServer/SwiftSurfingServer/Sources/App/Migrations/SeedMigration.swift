//
//  SeedMigration.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation
import Fluent

struct SeedMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let user1 = User(fullName: "user1", email: "user1@test.com", externalId: "V0Us6HAL4jemuQHUn5xFp4yLynk1")
        let user2 = User(fullName: "user2", email: "user2@test.com", externalId: "GY24BwDYOpfqLnHFlAWHgrIH46s2")
        try await user1.save(on: database)
        try await user2.save(on: database)
        
        if user1.id != nil && user2.id != nil {
            let couch1 = Couch(userId: user1.id!, name: "NemOtthon", address: "Retek utca 8", city: "Budapest", country: "Hungary", latitude: 47.5081239, longitude: 19.0254081, maxGuests: 1, description: "", imageUrls: ["https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/745190D7-D736-4116-BB30-B7C2AF64000B%20-%200?alt=media&token=ff75ebd2-48be-40ba-97d5-99e7fabbdcd0"])
            let couch2 = Couch(userId: user1.id!, name: "New home", address: "Magyar Tudósok Körútja 2", city: "Budapest", country: "Hungary", latitude: 47.4726691, longitude: 19.0597849, maxGuests: 4, description: "BME Q épület", imageUrls: ["https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/7F4F7A71-C040-4976-A7B4-D1B8B8CF9484%20-%200?alt=media&token=6bbe67a5-0d9a-4591-9e8c-88aaba80adf1", "https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/7F4F7A71-C040-4976-A7B4-D1B8B8CF9484%20-%201?alt=media&token=7cb69b79-0aa2-42d3-92d7-9a6f92f61309"])
            let couch3 = Couch(userId: user2.id!, name: "Agancs", address: "1121, Budapest Agancs út 20", city: "Budapest", country: "Hungary", latitude: 47.4953668, longitude: 18.9809263, maxGuests: 3, description: "", imageUrls: ["https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/8AE6CA38-4084-4A10-BE8C-BF62D703CCBB%20-%200?alt=media&token=3e1e3de4-1a10-429c-87ce-fe9266861308"])
            let couch4 = Couch(userId: user2.id!, name: "Fehervari", address: "1116 Budapest, Fehérvári út 193", city: "Budapest", country: "Hungary", latitude: 47.4506919, longitude: 19.0375581, maxGuests: 2, description: "", imageUrls: ["https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/B246B217-BBFB-430D-A67A-3205F884087E%20-%200?alt=media&token=0441eeb2-e2b7-4173-850d-fb0d74cda223", "https://firebasestorage.googleapis.com/v0/b/swiftsurfing-52ae5.appspot.com/o/B246B217-BBFB-430D-A67A-3205F884087E%20-%201?alt=media&token=2ef0542d-c3ef-4b17-aee4-68848b5aa950"])
            
            try await couch1.save(on: database)
            try await couch2.save(on: database)
            try await couch3.save(on: database)
            try await couch4.save(on: database)
            
            /*let couches = [couch1, couch2, couch3, couch4]
            for couch in couches {
                var homeConfiguration1 = HomeConfiguration(couchId: couch.id!, type: .heating, state: .off)
                var homeConfiguration2 = HomeConfiguration(couchId: couch.id!, type: .cooling, state: .off)
                var homeConfiguration3 = HomeConfiguration(couchId: couch.id!, type: .weatherWatcher, state: .off)
                
                try await homeConfiguration1.save(on: database)
                try await homeConfiguration2.save(on: database)
                try await homeConfiguration3.save(on: database)
            }*/
        }
    }
    
    func revert(on database: Database) async throws {
        try await User.query(on: database).delete()
        try await Couch.query(on: database).delete()
        try await HomeConfiguration.query(on: database).delete()
    }
}
