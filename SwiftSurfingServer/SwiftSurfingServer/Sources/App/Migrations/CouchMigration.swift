//
//  CouchMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Fluent

struct CouchMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("couches")
            .id()
            .field("ownerId", .uuid, .required, .references("users", "id"))
            .field("name", .string)
            .field("address", .string, .required)
            .field("city", .string, .required)
            .field("country", .string, .required)
            .field("latitude", .double, .required)
            .field("longitude", .double, .required)
            .field("maxGuests", .int, .required)
            .field("description", .string)
            .field("imageUrls", .array(of: .string))
            .field("ratingAverage", .int)
            .field("ratingCount", .int)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("couches").delete()
    }
}
