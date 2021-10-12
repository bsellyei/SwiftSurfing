//
//  ConversationServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation

protocol ConversationServiceProtocol {
    func create(conversation: Conversation, completion: @escaping (Bool) -> Void)
    
    func update(conversation: Conversation, completion: @escaping (Bool) -> Void)
    
    func getAllConversations(completion: @escaping ([Conversation]) -> Void)
}
