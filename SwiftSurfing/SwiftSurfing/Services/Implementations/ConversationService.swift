//
//  ConversationService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation
import Firebase
import FirebaseAuth

class ConversationService: ConversationServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Conversation")
    }
    
    func create(conversation: Conversation, completion: @escaping (Bool) -> Void) {
        if conversation.fromId.isEmpty {
            let user = Auth.auth().currentUser
            guard
                let userId = user?.uid
            else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            conversation.fromId = userId
        }
        
        let conversationRef = self.databaseRef?.child(conversation.id)
        conversationRef?.setValue(conversation.toAnyObject())
        
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func update(conversation: Conversation, completion: @escaping (Bool) -> Void) {
        let conversationRef = self.databaseRef?.child(conversation.id)
        conversationRef?.setValue(conversation.toAnyObject())
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func getAllConversations(completion: @escaping ([Conversation]) -> Void) {
        let user = Auth.auth().currentUser
        guard let userId = user?.uid else {
            DispatchQueue.main.async {
                completion([])
            }
            return
        }
        
        databaseRef?.queryOrdered(byChild: "userId").queryEqual(toValue: userId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let conversations = snapshot.reversed().compactMap(Conversation.init)
            DispatchQueue.main.async {
                completion(conversations)
            }
        })
    }
}
