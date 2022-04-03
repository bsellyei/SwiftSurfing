//
//  IConversationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

//sourcery: AutoMockable
protocol IConversationService {
    func getConversations(user: User) async throws -> [Conversation]
    
    func createConversation(conversation: Conversation) async throws -> Conversation
    
    func deleteConversation(id: String?) async throws -> Bool
    
    func connectUsers(id: String?, users: [User]) async throws -> Bool
}
