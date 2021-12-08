//
//  UserConversationPivotMigration.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

struct UserConversationPivotMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user-conversation-pivot")
            .id()
            .field("userId", .uuid, .required, .references("users", "id", onDelete: .cascade))
            .field("conversationId", .uuid, .required, .references("conversations", "id", onDelete: .cascade))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user-conversation-pivot").delete()
    }
}
