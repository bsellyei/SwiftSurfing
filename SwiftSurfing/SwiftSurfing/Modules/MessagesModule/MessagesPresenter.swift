//
//  MessagesPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

class MessagesPresenter: ObservableObject {
    private let interactor: MessagesInteractor
    
    var conversation: Conversation
    
    @Published var name: String = ""
    @Published var messages: [Message] = []
    
    @Published var text: String
    
    init(interactor: MessagesInteractor, conversation: Conversation) {
        self.interactor = interactor
        self.conversation = conversation
        
        self.text = ""
    }
    
    func sendMessage() {
        let message = Message()
        message.isSentByCurrentUser = true
        message.sendTime = Date()
        message.message = text
        message.conversationId = conversation.id
        
        messages.append(message)
        messages.sort(by: { $0.sendTime > $1.sendTime })
        
        text = ""
        
        self.interactor.sendMessage(message: message, completion: { _ in })
    }
    
    func getMessages() {
        let neededUserId = conversation.fromId.isEmpty ? conversation.toId : conversation.fromId
        self.interactor.getMessages(conversationId: conversation.id, completion: { messages in
            self.interactor.getUser(userId: neededUserId, completion: { user in
                guard let userName = user else { return }
                
                self.messages = messages
                self.name = userName.fullName
            })
        })
    }
}
