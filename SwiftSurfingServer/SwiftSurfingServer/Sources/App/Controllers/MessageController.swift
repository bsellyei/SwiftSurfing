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
    
    func getMessages(req: Request) throws -> EventLoopFuture<[Message]> {
        let parameter = req.parameters.get("conversationId")!
        let conversationId = UUID(uuidString: parameter)
        return Message.query(on: req.db)
                .filter(\.$conversation.$id == conversationId!)
                .all()
    }
    
    func createMessage(req: Request) throws -> EventLoopFuture<Message> {
        let data = try req.content.decode(CreateMessageData.self)
        let message = Message(userId: data.userId, conversationId: data.conversationId, text: data.text, date: Date())
        return message.save(on: req.db).map { message }
    }
    
    func deleteMessage(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Message.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}

struct CreateMessageData: Content {
    let userId: UUID
    let conversationId: UUID
    let text: String
}
