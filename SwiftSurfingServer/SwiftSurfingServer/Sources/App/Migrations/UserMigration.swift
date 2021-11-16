//
//  UserMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Fluent

struct UserMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database
            .schema("users")
            .id()
            .field("fullName", .string, .required)
            .field("email", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
