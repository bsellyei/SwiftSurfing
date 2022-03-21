//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

struct ConversationMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database
            .schema("conversations")
            .id()
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database
            .schema("conversations")
            .delete()
    }
}
