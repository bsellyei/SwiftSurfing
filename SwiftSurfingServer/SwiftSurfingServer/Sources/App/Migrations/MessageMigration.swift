//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

struct MessageMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database
            .schema("messages")
            .id()
            .field("userId", .uuid, .required, .references("users", "id"))
            .field("conversationId", .uuid, .required, .references("conversations", "id"))
            .field("text", .string, .required)
            .field("sendDate", .datetime, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("messages").delete()
    }
}
