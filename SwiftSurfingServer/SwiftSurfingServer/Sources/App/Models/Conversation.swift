//
//  Conversation.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

final class Conversation: Model, Content {
    static let schema = "conversations"
    
    @ID(key: .id)
    var id: UUID?
    
    @Siblings(through: UserConversationPivot.self, from: \.$conversation, to: \.$user)
    var users: [User]
    
    @Children(for: \.$conversation)
    var messages: [Message]
    
    init() {}
    
    init(id: UUID? = nil) {
        self.id = id
    }
}
