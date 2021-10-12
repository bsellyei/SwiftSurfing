//
//  ConversationInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation

class ConversationsInteractor {
    private let conversationService: ConversationServiceProtocol
    private let messageService: MessageServiceProtocol
    
    init(conversationService: ConversationServiceProtocol, messageService: MessageServiceProtocol) {
        self.conversationService = conversationService
        self.messageService = messageService
    }
    
    func getConversations(completion: @escaping ([Conversation]) -> Void) {
        conversationService.getAllConversations(completion: completion)
    }
    
    func getLastMessages(conversations: [Conversation], completion: @escaping (String, Message?) -> Void) {
        for conversation in conversations {
            messageService.get(id: conversation.lastMessageId, completion: { message in
                DispatchQueue.main.async {
                    completion(conversation.id, message)
                }
            })
        }
    }
}
