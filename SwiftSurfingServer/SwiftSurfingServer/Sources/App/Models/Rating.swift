//
//  Rating.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 23..
//

import Foundation
import FluentKit
import Vapor

final class Rating: Model, Content {
    static let schema = "ratings"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "value")
    var value: Int
    
    @Field(key: "comment")
    var comment: String
    
    @Parent(key: "userId")
    var user: User
    
    @Parent(key: "couchId")
    var couch: Couch
    
    init() {}
    
    init(id: UUID? = nil, userId: User.IDValue, couchId: Couch.IDValue, value: Int = 0, comment: String = "") {
        self.id = id
        self.$user.id = userId
        self.$couch.id = couchId
        self.value = value
        self.comment = comment
    }
}
