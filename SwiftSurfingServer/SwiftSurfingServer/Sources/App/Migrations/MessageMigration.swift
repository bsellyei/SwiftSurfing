//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

struct MessageMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("messages")
            .id()
            .field("userId", .uuid, .required, .references("users", "id", onDelete: .cascade))
            .field("conversationId", .uuid, .required, .references("conversations", "id", onDelete: .cascade))
            .field("text", .string, .required)
            .field("sendDate", .datetime, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("messages").delete()
    }
}
