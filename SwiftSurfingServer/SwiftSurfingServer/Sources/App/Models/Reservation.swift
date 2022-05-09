//
//  Reservation.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 01..
//

import Foundation
import Vapor
import Fluent

final class Reservation: Model, Content {
    static let schema = "reservations"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "userId")
    var user: User
    
    @Parent(key: "couchId")
    var couch: Couch
    
    @Field(key: "guestsNum")
    var guestsNum: Int
    
    @Field(key: "start")
    var start: Date
    
    @Field(key: "end")
    var end: Date
    
    init() {}
    
    init(id: UUID? = nil, guestId: User.IDValue, couchId: Couch.IDValue, guestsNum: Int = 0, start: Date = Date(), end: Date = Date()) {
        self.id = id
        self.$user.id = guestId
        self.$couch.id = couchId
        self.guestsNum = guestsNum
        self.start = start
        self.end = end
    }
}
