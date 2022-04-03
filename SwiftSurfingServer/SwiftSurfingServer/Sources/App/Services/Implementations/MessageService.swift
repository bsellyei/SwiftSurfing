//
//  MessageService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 31..
//

import Foundation
import Fluent

class MessageService: IMessageService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getMessages(conversationId: String?) async throws -> [Message] {
        let uuid = UUID(uuidString: conversationId!)
        return try await Message.query(on: db)
            .filter(\.$conversation.$id == uuid!)
            .all()
    }
    
    func createMessage(message: Message) async throws -> Message {
        try await message.save(on: db)
        return message
    }
    
    func deleteMessage(id: String?) async throws -> Bool {
        let found = try await getMessage(id: id)
        guard let message = found else { return false }
        try await message.delete(on: db)
        
        return true
    }
    
    func getMessage(id: String?) async throws -> Message? {
        let uuid = UUID(uuidString: id!)
        let found = try await Message.find(uuid, on: db)
        guard let message = found else { return nil }
        
        return message
    }
}
