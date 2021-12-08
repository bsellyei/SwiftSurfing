//
//  UserConversationPivot.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent

final class UserConversationPivot: Model {
    static let schema = "user-conversation-pivot"
    
    @ID
    var id: UUID?
    
    @Parent(key: "userId")
    var user: User
    
    @Parent(key: "conversationId")
    var conversation: Conversation
    
    init() {}
    
    init(id: UUID? = nil, user: User, conversation: Conversation) throws {
        self.id = id
        self.$user.id = try user.requireID()
        self.$conversation.id = try conversation.requireID()
    }
}
