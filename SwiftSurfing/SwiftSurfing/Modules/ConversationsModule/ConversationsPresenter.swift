//
//  ConversationPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

class ConversationsPresenter: ObservableObject {
    private let interactor: ConversationsInteractor
    private let router: ConversationsRouter = ConversationsRouter()
    
    @Published var conversations: [Conversation] = []
    
    @Published var lastMessages: [String:Message] = [:]
    @Published var userNames: [String:String] = [:]
    
    init(interactor: ConversationsInteractor) {
        self.interactor = interactor
    }
    
    func getConversations() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getConversations(completion: { conversations in
                self.conversations = conversations
                self.interactor.getLastMessages(conversations: conversations, completion: { conversationId, lastMessage in
                    if let message = lastMessage {
                        if message.isInvitation {
                            message.message = "This is an invitation from \(message.senderId)"
                        }
                        
                        self.lastMessages[conversationId] = lastMessage
                    }
                })
                
                self.interactor.getUserNames(conversations: conversations, completion: { conversationId, userName in
                    self.userNames[conversationId] = userName
                })
            })
        }
    }
    
    func linkBuilderForMessages<Content: View>(conversation: Conversation, @ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeMessagesView(conversation: conversation)) {
            content()
        }
    }
}
