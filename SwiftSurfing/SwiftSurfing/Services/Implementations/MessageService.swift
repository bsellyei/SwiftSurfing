//
//  MessageService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation
import Firebase

class MessageService: MessageServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Message")
    }
    
    func send(message: Message, completion: @escaping (Bool) -> Void) {
        if message.senderId.isEmpty {
            let user = Auth.auth().currentUser
            guard
                let userId = user?.uid
            else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            message.senderId = userId
        }
        
        let messageRef = self.databaseRef?.child(message.id)
        messageRef?.setValue(message.toAnyObject())
        
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func get(id: String, completion: @escaping (Message?) -> Void) {
        let messageRef = databaseRef?.child(id)
        messageRef?.observeSingleEvent(of: .value, with: { snapshot in
            let message = Message(snapshot: snapshot)
            DispatchQueue.main.async {
                completion(message)
            }
        })
    }
}
