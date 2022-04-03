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
    let conversationService: IConversationService
    let userService: IUserService
    
    init(conversationService: IConversationService, userService: IUserService) {
        self.conversationService = conversationService
        self.userService = userService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let conversations = routes.grouped("conversations")
        conversations.get(":userId", use: getConversations)
        conversations.post(use: createConversation)
        conversations.delete(":id", use: deleteConversation)
    }
    
    func getConversations(req: Request) async throws -> [Conversation] {
        let found = try await userService.getUser(id: req.parameters.get("userId"))
        guard let user = found else { throw Abort(.notFound) }
        return try await conversationService.getConversations(user: user)
    }
    
    func createConversation(req: Request) async throws -> Conversation {
        let data = try req.content.decode(CreateConversationData.self)
        let conversation = Conversation()
        _ = try await conversationService.createConversation(conversation: conversation)
        
        let foundUser1 = try await userService.getUser(id: data.toUserId.uuidString)
        guard let user1 = foundUser1 else { throw Abort(.notFound) }
        var users = [user1]
        
        let foundUser2 = try await userService.getUser(id: data.fromUserId.uuidString)
        guard let user2 = foundUser2 else { throw Abort(.notFound) }
        users.append(user2)
        
        let success = try await conversationService.connectUsers(id: conversation.id?.uuidString, users: users)
        if !success { throw Abort(.notFound) }
        
        return conversation
    }
    
    func deleteConversation(req: Request) async throws -> HTTPStatus {
        let success = try await conversationService.deleteConversation(id: req.parameters.get("id"))
        if !success { throw Abort(.notFound) }
        
        return .noContent
    }
}

struct CreateConversationData: Content {
    let fromUserId: UUID
    let toUserId: UUID
}
