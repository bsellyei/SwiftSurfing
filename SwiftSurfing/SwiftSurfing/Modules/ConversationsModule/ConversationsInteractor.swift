//
//  ConversationInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import FirebaseAuth

class ConversationsInteractor {
    private let conversationService: ConversationServiceProtocol
    private let messageService: MessageServiceProtocol
    private let userService: UserServiceProtocol
    
    init(conversationService: ConversationServiceProtocol, messageService: MessageServiceProtocol, userService: UserServiceProtocol) {
        self.conversationService = conversationService
        self.messageService = messageService
        self.userService = userService
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
    
    func getUserNames(conversations: [Conversation], completion: @escaping (String, String) -> Void) {
        let currentUser = Auth.auth().currentUser
        
        for conversation in conversations {
            if conversation.toId == currentUser?.uid {
                userService.get(id: conversation.fromId, completion: { user in
                    guard
                        let userName = user
                    else { return }
                    
                    DispatchQueue.main.async {
                        completion(conversation.id, userName.fullName)
                    }
                })
            } else {
                userService.get(id: conversation.toId, completion: { user in
                    guard
                        let userName = user
                    else { return }
                    
                    DispatchQueue.main.async {
                        completion(conversation.id, userName.fullName)
                    }
                })
            }
        }
    }
}
