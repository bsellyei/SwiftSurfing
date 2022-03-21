//
//  RatingMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 23..
//

import Foundation
import Fluent

struct RatingMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("ratings")
            .id()
            .field("userId", .uuid, .required, .references("users", "id"))
            .field("couchId", .uuid, .required, .references("couches", "id"))
            .field("value", .int, .required)
            .field("comment", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("ratings").delete()
    }
}
