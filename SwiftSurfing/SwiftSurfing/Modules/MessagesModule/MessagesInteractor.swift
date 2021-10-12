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
    
    init(messageService: MessageServiceProtocol) {
        self.messageService = messageService
    }
    
    func getMessages(conversationId: String, completion: @escaping ([Message]) -> Void) {
        messageService.getAllMessages(conversationId: conversationId, completion: { messages in
            let user = Auth.auth().currentUser
            if let userId = user?.uid {
                for message in messages {
                    message.isSentByCurrentUser = message.senderId == userId
                    
                    if message.isInvitation {
                        message.message = "This is an invitation from \(message.senderId)"
                    }
                }
            }
            
            DispatchQueue.main.async {
                completion(messages)
            }
        })
    }
}
