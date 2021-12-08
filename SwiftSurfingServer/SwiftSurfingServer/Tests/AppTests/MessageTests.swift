//
//  MessageTests.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 07..
//

@testable import App
import XCTVapor

final class MessageTests: XCTestCase {
    let messagesURI = "/messages/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetMessages() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let conversation1 = try Conversation.create(fromUser: user1, toUser: user2, on: app.db)
        let message1 = try Message.create(user: user1, conversation: conversation1, text: "Hello!", on: app.db)
        let message2 = try Message.create(user: user2, conversation: conversation1, text: "Hi", on: app.db)
        
        try app.test(.GET, "\(messagesURI)\(conversation1.id!)", afterResponse: { response in
            let messages = try response.content.decode([Message].self)
            
            XCTAssertEqual(messages.count, 2)
            XCTAssertEqual(messages[0].id, message1.id)
            XCTAssertEqual(messages[0].$user.id, message1.$user.id)
            XCTAssertEqual(messages[0].$conversation.id, message1.$conversation.id)
            XCTAssertEqual(messages[0].text, message1.text)
            
            XCTAssertEqual(messages[1].id, message2.id)
            XCTAssertEqual(messages[1].$user.id, message2.$user.id)
            XCTAssertEqual(messages[1].$conversation.id, message2.$conversation.id)
            XCTAssertEqual(messages[1].text, message2.text)
        })
    }
    
    func testCreateMessage() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let conversation1 = try Conversation.create(fromUser: user1, toUser: user2, on: app.db)
        let message1 = CreateMessageData(userId: user1.id!, conversationId: conversation1.id!, text: "Hello!")
        
        try app.test(.POST, messagesURI, beforeRequest: { request in
            try request.content.encode(message1)
        }, afterResponse: { response in
            let message = try response.content.decode(Message.self)
            
            XCTAssertNotNil(message.id)
            XCTAssertEqual(message.$user.id, user1.id)
            XCTAssertEqual(message.$conversation.id, conversation1.id)
            XCTAssertEqual(message.text, message1.text)
        })
    }
    
    func testDeleteMessage() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let conversation1 = try Conversation.create(fromUser: user1, toUser: user2, on: app.db)
        let message1 = try Message.create(user: user1, conversation: conversation1, text: "Hello!", on: app.db)
        let message2 = try Message.create(user: user2, conversation: conversation1, text: "Hi", on: app.db)
        
        try app.test(.GET, "\(messagesURI)\(conversation1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 2)
        })
        
        try app.test(.DELETE, "\(messagesURI)\(message2.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(messagesURI)\(conversation1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 1)
        })
        
        try app.test(.DELETE, "\(messagesURI)\(message1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(messagesURI)\(conversation1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 0)
        })
    }
}
