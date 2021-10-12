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
    
    @Published var messages: [Message] = []
    
    @State var text: String = ""
    
    init(interactor: MessagesInteractor, conversation: Conversation) {
        self.interactor = interactor
        self.conversation = conversation
    }
    
    func sendMessage() {
        
    }
    
    func getMessages() {
        interactor.getMessages(conversationId: conversation.id, completion: { messages in
            self.messages = messages
        })
    }
}
