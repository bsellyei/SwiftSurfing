//
//  CouchMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Fluent

struct CouchMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("couches")
            .id()
            .field("userId", .uuid, .required, .references("users", "id", onDelete: .cascade))
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
    
    func revert(on database: Database) async throws {
        try await database
            .schema("couches")
            .delete()
    }
}
