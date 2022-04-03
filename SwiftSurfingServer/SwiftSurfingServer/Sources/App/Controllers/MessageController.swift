//
//  MessageController.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

struct MessageController: RouteCollection {
    let messageService: IMessageService
    
    init(messageService: IMessageService) {
        self.messageService = messageService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let messages = routes.grouped("messages")
        messages.get(":conversationId", use: getMessages)
        messages.post(use: createMessage)
        messages.delete(":id", use: deleteMessage)
    }
    
    func getMessages(req: Request) async throws -> [Message] {
        return try await messageService.getMessages(conversationId: req.parameters.get("conversationId"))
    }
    
    func createMessage(req: Request) async throws -> Message {
        let data = try req.content.decode(CreateMessageData.self)
        let message = Message(userId: data.userId, conversationId: data.conversationId, text: data.text, date: Date())
        _ = try await messageService.createMessage(message: message)
        
        return message
    }
    
    func deleteMessage(req: Request) async throws -> HTTPStatus {
        let success = try await messageService.deleteMessage(id: req.parameters.get("messageId"))
        if !success { throw Abort(.notFound) }
        
        return .noContent
    }
}

struct CreateMessageData: Content {
    let userId: UUID
    let conversationId: UUID
    let text: String
}
