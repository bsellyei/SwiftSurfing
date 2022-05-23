//
//  UserMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Fluent

struct UserMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("users")
            .id()
            .field("fullName", .string, .required)
            .field("email", .string, .required)
            .field("externalId", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database
            .schema("users")
            .delete()
    }
}
