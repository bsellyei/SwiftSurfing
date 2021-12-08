//
//  ConversationTests.swift
//  
//
//  Created by Séllyei Bence on 2021. 12. 07..
//

@testable import App
import XCTVapor

final class ConversationTests: XCTestCase {
    let conversationsURI = "/conversations/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetConversations() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let user3 = try User.create(on: app.db)
        let conversation1 = try Conversation.create(fromUser: user1, toUser: user2, on: app.db)
        let conversation2 = try Conversation.create(fromUser: user1, toUser: user3, on: app.db)
        
        try app.test(.GET, "\(conversationsURI)\(user1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 2)
            XCTAssertEqual(conversations[0].id, conversation1.id)
            //XCTAssertEqual(conversations[0].$users.wrappedValue[0].id, user1.id)
            //XCTAssertEqual(conversations[0].$users.wrappedValue[1].id, user2.id)
            
            XCTAssertEqual(conversations[1].id, conversation2.id)
            //XCTAssertEqual(conversations[1].$users.wrappedValue[0].id, user1.id)
            //XCTAssertEqual(conversations[1].$users.wrappedValue[1].id, user3.id)
        })
    }
    
    func testCreateConversation() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let conversation1 = CreateConversationData(fromUserId: user1.id!, toUserId: user2.id!)
        
        try app.test(.POST, conversationsURI, beforeRequest: { request in
            try request.content.encode(conversation1)
        }, afterResponse: { response in
            let conversation = try response.content.decode(Conversation.self)
            
            XCTAssertNotNil(conversation.id)
            //XCTAssertEqual(conversation.$users.wrappedValue[0].id, user1.id)
            //XCTAssertEqual(conversation.$users.wrappedValue[1].id, user2.id)
        })
    }
    
    func testDeleteConversation() throws {
        let user1 = try User.create(on: app.db)
        let user2 = try User.create(on: app.db)
        let conversation1 = try Conversation.create(fromUser: user1, toUser: user2, on: app.db)
        
        try app.test(.GET, "\(conversationsURI)\(user1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 1)
        })
        
        try app.test(.DELETE, "\(conversationsURI)\(conversation1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(conversationsURI)\(user1.id!)", afterResponse: { response in
            let conversations = try response.content.decode([Conversation].self)
            
            XCTAssertEqual(conversations.count, 0)
        })
    }
}
