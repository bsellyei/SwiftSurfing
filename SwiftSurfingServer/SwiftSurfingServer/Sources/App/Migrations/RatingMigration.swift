//
//  RatingMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 23..
//

import Foundation
import Fluent

struct RatingMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database
            .schema("ratings")
            .id()
            .field("userId", .uuid, .required, .references("users", "id"))
            .field("couchId", .uuid, .required, .references("couches", "id"))
            .field("value", .int, .required)
            .field("comment", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("ratings").delete()
    }
}
