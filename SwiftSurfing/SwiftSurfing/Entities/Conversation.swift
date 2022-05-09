//
//  Conversation.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation
import Firebase

class Conversation: Identifiable {
    let ref: DatabaseReference?
    var id: String
    var fromId: String
    var toId: String
    var lastMessageId: String
    
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.fromId = ""
        self.toId = ""
        self.lastMessageId = ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let fromId = value["fromId"] as? String,
            let toId = value["toId"] as? String,
            let lastMessageId = value["lastMessageId"] as? String
        else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.fromId = fromId
        self.toId = toId
        self.lastMessageId = lastMessageId
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "fromId": fromId,
            "toId": toId,
            "lastMessageId": lastMessageId
        ]
    }
}
