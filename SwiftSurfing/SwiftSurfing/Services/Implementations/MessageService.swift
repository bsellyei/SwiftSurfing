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
            AuthenticationManager.shared.getCurrentUserId(completion: { userId in
                if userId == nil {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                    return
                }
                
                message.senderId = userId!
                
                MessagesAPI.addMessage(body: MessageTransformator.transformToAPIModel(message: message), completion: { _, _ in
                    DispatchQueue.main.async {
                        completion(true)
                    }
                })
            })
        }
        
        MessagesAPI.addMessage(body: MessageTransformator.transformToAPIModel(message: message), completion: { _, _ in
            DispatchQueue.main.async {
                completion(true)
            }
        })
        
        //let messageRef = self.databaseRef?.child(message.id)
        //messageRef?.setValue(message.toAnyObject())
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
    
    func getAllMessages(conversationId: String, completion: @escaping ([Message]) -> Void) {
        MessagesAPI.getAllMessagesInConversation(conversationId: conversationId, completion: { messages, _ in
            DispatchQueue.main.async {
                completion(MessageTransformator.transformToClientModel(messages: messages!))
            }
        })
        
        /*databaseRef?.queryOrdered(byChild: "conversationId").queryEqual(toValue: conversationId)
            .observeSingleEvent(of: .value, with: { (snapshot) in
                guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                    return
                }
                
                let messages = snapshot.reversed().compactMap(Message.init)
        })*/
    }
    
    class MessageTransformator {
        static func transformToClientModel(message: APIMessage) -> Message {
            let result = Message()
            result.id = message._id!
            result.conversationId = message.conversation?._id! ?? ""
            result.senderId = message.user?._id! ?? ""
            result.message = message.text!
            return result
        }
        
        static func transformToAPIModel(message: Message) -> APIMessage {
            let result = APIMessage(_id: message.id, user: APIUser(_id: message.senderId, fullName: "", email: ""), conversation: APIConversation(_id: message.conversationId, users: [], messages: []), text: message.message)
            
            return result
        }
        
        static func transformToClientModel(messages: [APIMessage]) -> [Message] {
            var result: [Message] = []
            for message in messages {
                result.append(MessageTransformator.transformToClientModel(message: message))
            }
            
            return result
        }
    }
}
