//
//  ConversationController.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

struct ConversationController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let conversations = routes.grouped("conversations")
        conversations.get(":userId", use: getConversations)
        conversations.post(use: createConversation)
        conversations.delete(":id", use: deleteConversation)
    }
    
    func getConversations(req: Request) throws -> EventLoopFuture<[Conversation]> {
        User.find(req.parameters.get("userId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { user in
                //user.$conversations.get(on: req.db)
                user.$conversations.query(on: req.db).all()
            }
    }
    
    func createConversation(req: Request) throws -> EventLoopFuture<Conversation> {
        let data = try req.content.decode(CreateConversationData.self)
        let conversation = Conversation()
        _ = conversation.save(on: req.db)
        
        let fromUser = User.find(data.fromUserId, on: req.db).unwrap(or: Abort(.notFound))
        let conversationQuery = Conversation.find(conversation.id, on: req.db).unwrap(or: Abort(.notFound))
        _ = conversationQuery.and(fromUser).flatMap { conversation, user in
            conversation.$users.attach(user, on: req.db).transform(to: conversation)
        }
        
        let toUser = User.find(data.toUserId, on: req.db).unwrap(or: Abort(.notFound))
        return conversationQuery.and(toUser).flatMap { conversation, user in
            conversation.$users.attach(user, on: req.db).transform(to: conversation)
        }
    }
    
    func deleteConversation(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Conversation.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}

struct CreateConversationData: Content {
    let fromUserId: UUID
    let toUserId: UUID
}
