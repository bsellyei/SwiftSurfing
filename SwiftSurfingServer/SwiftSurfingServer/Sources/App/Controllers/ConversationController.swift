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
    
    func getConversations(req: Request) async throws -> [Conversation] {
        let found = try await User.find(req.parameters.get("userId"), on: req.db)
        guard let user = found else { throw Abort(.notFound) }
        return try await user.$conversations.query(on: req.db).all()
    }
    
    func createConversation(req: Request) async throws -> Conversation {
        let data = try req.content.decode(CreateConversationData.self)
        let conversation = Conversation()
        try await conversation.save(on: req.db)
        
        let foundUser1 = try await User.find(data.fromUserId, on: req.db)
        guard let user1 = foundUser1 else { throw Abort(.notFound) }
        var users = [user1]
        
        let foundUser2 = try await User.find(data.fromUserId, on: req.db)
        guard let user2 = foundUser2 else { throw Abort(.notFound) }
        users.append(user2)
        
        let conversationFromDb = try await Conversation.find(conversation.id, on: req.db)
        guard let queriedConversation = conversationFromDb else { throw Abort(.notFound) }
        try await queriedConversation.$users.attach(users, on: req.db)
        
        return queriedConversation
    }
    
    func deleteConversation(req: Request) async throws -> HTTPStatus {
        let found = try await Conversation.find(req.parameters.get("id"), on: req.db)
        guard let conversation = found else { throw Abort(.notFound) }
        try await conversation.delete(on: req.db)
        
        return .noContent
    }
}

struct CreateConversationData: Content {
    let fromUserId: UUID
    let toUserId: UUID
}
