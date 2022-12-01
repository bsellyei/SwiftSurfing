//
//  MessagesInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import FirebaseAuth

class MessagesInteractor {
    private let messageService: MessageServiceProtocol
    private let userService: UserServiceProtocol
    
    init(messageService: MessageServiceProtocol, userService: UserServiceProtocol) {
        self.messageService = messageService
        self.userService = userService
    }
    
    func getMessages(conversationId: String, completion: @escaping ([Message]) -> Void) {
        messageService.getAllMessages(conversationId: conversationId, completion: { messages in
            AuthenticationManager.shared.getCurrentUserId(completion: { userId in
                for message in messages {
                    message.isSentByCurrentUser = message.senderId == userId
                }
                
                var sorted = messages
                sorted.sort(by: { $0.sendTime > $1.sendTime })
                DispatchQueue.main.async {
                    completion(sorted)
                }
            })
        })
    }
    
    func getUser(userId: String, completion: @escaping (User?) -> Void) {
        userService.get(id: userId, completion: completion)
    }
    
    func sendMessage(message: Message, completion: @escaping (Bool) -> Void) {
        messageService.send(message: message, completion: completion)
    }
}
