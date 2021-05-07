//
//  User.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation

import Foundation
import Firebase

class User: Identifiable {
    let ref: DatabaseReference?
    var id: String
    var fullName: String
    var email: String
 
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.fullName = ""
        self.email = ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let fullName = value["fullName"] as? String,
            let email = value["email"] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.fullName = fullName
        self.email = email
    }
    
    func toAnyObject() -> Any {
        return [
            "id": id,
            "fullName": fullName,
            "email": email
        ]
    }
}
