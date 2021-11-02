//
//  Rating.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation
import Firebase

class Rating: Identifiable {
    let ref: DatabaseReference?
    let id: String
    var userId: String
    var couchId: String
    var value: Int
    var comment: String
    
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.userId = ""
        self.couchId = ""
        self.value = 0
        self.comment = ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let userId = value["userId"] as? String,
            let couchId = value["couchId"] as? String,
            let ratingValue = value["value"] as? Int,
            let comment = value["comment"] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.userId = userId
        self.couchId = couchId
        self.value = ratingValue
        self.comment = comment
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "userId": userId,
            "couchId": couchId,
            "value": value,
            "comment": comment
        ]
    }
}
