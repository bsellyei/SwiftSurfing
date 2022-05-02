//
//  ConversationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

class ConversationService: IConversationService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getConversations(user: User) async throws -> [Conversation] {
        return try await user.$conversations.query(on: db).all()
    }
    
    func getConversation(id: String?) async throws -> Conversation? {
        let uuid = UUID(uuidString: id!)
        let found = try await Conversation.find(uuid, on: db)
        guard let conversation = found else { return nil }
        
        return conversation
    }
    
    func createConversation(conversation: Conversation, users: [User]) async throws -> Conversation {
        try await conversation.save(on: db)
        let _ = try await connectUsers(id: conversation.id?.uuidString, users: users)
        
        return conversation
    }
    
    func deleteConversation(id: String?) async throws -> Bool {
        let found = try await getConversation(id: id)
        guard let conversation = found else { return false }
        try await conversation.delete(on: db)
        
        return true
    }
    
    func connectUsers(id: String?, users: [User]) async throws -> Bool {
        let found = try await getConversation(id: id)
        guard let conversation = found else { return false }
        try await conversation.$users.attach(users, on: db)
        
        return true
        
    }
}
