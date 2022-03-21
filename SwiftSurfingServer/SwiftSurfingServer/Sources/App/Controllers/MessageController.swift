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
    func boot(routes: RoutesBuilder) throws {
        let messages = routes.grouped("messages")
        messages.get(":conversationId", use: getMessages)
        messages.post(use: createMessage)
        messages.delete(":id", use: deleteMessage)
    }
    
    func getMessages(req: Request) async throws -> [Message] {
        let parameter = req.parameters.get("conversationId")!
        let conversationId = UUID(uuidString: parameter)
        return try await Message.query(on: req.db)
                .filter(\.$conversation.$id == conversationId!)
                .all()
    }
    
    func createMessage(req: Request) async throws -> Message {
        let data = try req.content.decode(CreateMessageData.self)
        let message = Message(userId: data.userId, conversationId: data.conversationId, text: data.text, date: Date())
        try await message.save(on: req.db)
        
        return message
    }
    
    func deleteMessage(req: Request) async throws -> HTTPStatus {
        let found = try await Message.find(req.parameters.get("id"), on: req.db)
        guard let message = found else { throw Abort(.notFound) }
        try await message.delete(on: req.db)
        
        return .noContent
    }
}

struct CreateMessageData: Content {
    let userId: UUID
    let conversationId: UUID
    let text: String
}
