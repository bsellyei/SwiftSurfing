//
//  Message.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

final class Message: Model, Content {
    static let schema = "messages"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "userId")
    var user: User
    
    @Parent(key: "conversationId")
    var conversation: Conversation
    
    @Field(key: "text")
    var text: String
    
    @Field(key: "sendDate")
    var date: Date
    
    init() {}
    
    init(id: UUID? = nil, userId: User.IDValue, conversationId: Conversation.IDValue, text: String, date: Date) {
        self.id = id
        self.$user.id = userId
        self.$conversation.id = conversationId
        self.text = text
        self.date = date
    }
}
