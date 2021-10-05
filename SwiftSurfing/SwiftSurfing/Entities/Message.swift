//
//  Message.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation
import Firebase

class Message: Identifiable {
    let ref: DatabaseReference?
    let id: String
    var conversationId: String
    var senderId: String
    var sendTime: Date
    var message: String
    var isInvitation: Bool
    
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.conversationId = ""
        self.senderId = ""
        self.sendTime = Date()
        self.message = ""
        self.isInvitation = false
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let conversationId = value["conversationId"] as? String,
            let senderId = value["senderId"] as? String,
            let sendTime = value["sendTime"] as? String,
            let message = value["message"] as? String,
            let isInvitation = value["isInvitation"] as? Bool
        else {
            return nil
        }
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = ""
        let date = dateformatter.date(from: sendTime)
        
        guard let sendDate = date
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.conversationId = conversationId
        self.senderId = senderId
        self.sendTime = sendDate
        self.message = message
        self.isInvitation = isInvitation
    }
    
    func toAnyObject() -> Any {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = ""
        let sendTimeString = dateformatter.string(from: sendTime)
        
        return [
            "id": id,
            "conversationId": conversationId,
            "senderId": senderId,
            "sendTime": sendTimeString,
            "message": message,
            "isInvitation": isInvitation
        ]
    }
}
