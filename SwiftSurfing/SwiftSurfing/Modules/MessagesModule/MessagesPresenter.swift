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
    
    @State var text: String = ""
    
    init(interactor: MessagesInteractor, conversation: Conversation) {
        self.interactor = interactor
        self.conversation = conversation
    }
    
    func sendMessage() {
        
    }
    
    func getMessages() {
        self.interactor.getMessages(conversationId: conversation.id, completion: { messages in
            self.messages = messages
        })
        
        self.interactor.getUser(userIds: [conversation.fromId, conversation.toId], completion: { user in
            guard
                let userName = user
            else {
                return
            }
                
            self.name = userName.fullName
        })
    }
}
