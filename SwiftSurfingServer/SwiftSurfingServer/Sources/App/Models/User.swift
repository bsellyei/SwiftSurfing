//
//  User.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor
import Fluent

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "fullName")
    var fullName: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "externalId")
    var externalId: String
    
    @Children(for: \.$user)
    var couches: [Couch]
    
    @Children(for: \.$user)
    var ratings: [Rating]
    
    @Children(for: \.$user)
    var messages: [Message]
    
    @Children(for: \.$user)
    var reservations: [Reservation]
    
    @Siblings(through: UserConversationPivot.self, from: \.$user, to: \.$conversation)
    var conversations: [Conversation]
    
    init() {}
    
    init(id: UUID? = nil, fullName: String, email: String, externalId: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.externalId = externalId
    }
}
