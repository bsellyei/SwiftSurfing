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
            AuthenticationManager.shared.getCurrentUserId(completion: { userId in
                if userId == nil {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                    return
                }
                
                conversation.fromId = userId!
            })
            
            ConversationAPI.addConversation(body: ConversationTransformator.transformToAPIModel(conversation: conversation), completion: { _, _ in
                DispatchQueue.main.async {
                    completion(true)
                }
            })
        }
        
        //let conversationRef = self.databaseRef?.child(conversation.id)
        //conversationRef?.setValue(conversation.toAnyObject())
        
        ConversationAPI.addConversation(body: ConversationTransformator.transformToAPIModel(conversation: conversation), completion: { _, _ in
            DispatchQueue.main.async {
                completion(true)
            }
        })
    }
    
    func update(conversation: Conversation, completion: @escaping (Bool) -> Void) {
        let conversationRef = self.databaseRef?.child(conversation.id)
        conversationRef?.setValue(conversation.toAnyObject())
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func getAllConversations(completion: @escaping ([Conversation]) -> Void) {
        AuthenticationManager.shared.getCurrentUserId(completion: { userId in
            if userId == nil {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            //let semaphore = DispatchSemaphore(value: 0)
            var conversations: [Conversation] = []
            ConversationAPI.getAllConversationsForUser(userId: userId!, completion: { result, _ in
                conversations = ConversationTransformator.transformToClientModel(conversations: result!)
                //semaphore.signal()
                
                DispatchQueue.main.async {
                    completion(conversations)
                }
            })
        })
        
        /*databaseRef?.queryOrdered(byChild: "toId").queryEqual(toValue: userId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            conversations = snapshot.reversed().compactMap(Conversation.init)
            semaphore.signal()
        })*/
        
        /*databaseRef?.queryOrdered(byChild: "fromId").queryEqual(toValue: userId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            
            
            let tempConversations = snapshot.reversed().compactMap(Conversation.init)
            semaphore.wait()
            DispatchQueue.main.async {
                completion(conversations + tempConversations)
            }
        })*/
    }
    
    class ConversationTransformator {
        static func transformToClientModel(conversation: APIConversation) -> Conversation {
            let result = Conversation()
            result.id = conversation._id!
            
            return result
        }
        
        static func transformToAPIModel(conversation: Conversation) -> APIConversation {
            let result = APIConversation(_id: conversation.id, users: [APIUser(_id: conversation.fromId, fullName: "", email: ""), APIUser(_id: conversation.toId, fullName: "", email: "")], messages: [])
            
            return result
        }
        
        static func transformToClientModel(conversations: [APIConversation]) -> [Conversation] {
            var result: [Conversation] = []
            for conversation in conversations {
                result.append(ConversationTransformator.transformToClientModel(conversation: conversation))
            }
            
            return result
        }
    }
}
