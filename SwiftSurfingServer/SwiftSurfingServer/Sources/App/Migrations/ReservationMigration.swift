//
//  ReservationMigration.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 01..
//

import Foundation
import Fluent

struct ReservationMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("reservations")
            .id()
            .field("userId", .uuid, .required, .references("users", "id", onDelete: .cascade))
            .field("couchId", .uuid, .required, .references("couches", "id", onDelete: .cascade))
            .field("guestsNum", .int, .required)
            .field("start", .datetime, .required)
            .field("end", .datetime, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("reservations").delete()
    }
}
