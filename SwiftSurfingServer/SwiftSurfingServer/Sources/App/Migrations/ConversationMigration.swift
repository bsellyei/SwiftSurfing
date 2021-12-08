//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

struct ConversationMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database
            .schema("conversations")
            .id()
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("conversations").delete()
    }
}
