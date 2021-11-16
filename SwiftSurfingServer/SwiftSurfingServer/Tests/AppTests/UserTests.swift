//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

@testable import App
import XCTVapor
import Foundation

final class UserTests: XCTestCase {
    let usersFullName = "Alice"
    let usersEmail = "alice@test.com"
    let usersURI = "/users/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetAllUsers() throws {
        let user = try User.create(fullName: usersFullName, email: usersEmail, on: app.db)
        _ = try User.create(on: app.db)
        
        try app.test(.GET, usersURI, afterResponse: { response in
            XCTAssertEqual(response.status, .ok)
            let users = try response.content.decode([User].self)
            
            XCTAssertEqual(users.count, 2)
            XCTAssertEqual(users[0].fullName, usersFullName)
            XCTAssertEqual(users[0].email, usersEmail)
            XCTAssertEqual(users[0].id, user.id)
        })
    }
    
    func testGetSingleUser() throws {
        let user = try User.create(fullName: usersFullName, email: usersEmail, on: app.db)
        
        try app.test(.GET, "\(usersURI)\(user.id!)", afterResponse: { response in
            let user = try response.content.decode(User.self)
            
            XCTAssertEqual(user.fullName, usersFullName)
            XCTAssertEqual(user.email, usersEmail)
            XCTAssertEqual(user.id, user.id)
        })
    }
    
    func testCreateUser() throws {
        let user = User(fullName: usersFullName, email: usersEmail)
        
        try app.test(.POST, usersURI, beforeRequest: { request in
            try request.content.encode(user)
        }, afterResponse: { response in
            let receivedUser = try response.content.decode(User.self)
            
            XCTAssertNotNil(receivedUser.id)
            XCTAssertEqual(receivedUser.fullName, usersFullName)
            XCTAssertEqual(receivedUser.email, usersEmail)
            
            try app.test(.GET, usersURI, afterResponse: { secondResponse in
                let users = try secondResponse.content.decode([User].self)
                
                XCTAssertEqual(users.count, 1)
                XCTAssertEqual(users[0].fullName, usersFullName)
                XCTAssertEqual(users[0].email, usersEmail)
                XCTAssertEqual(users[0].id, receivedUser.id)
            })
        })
    }
    
    func testDeleteUser() throws {
        let user1 = try User.create(fullName: usersFullName, email: usersEmail, on: app.db)
        
        try app.test(.GET, usersURI, afterResponse: { response in
            let users = try response.content.decode([User].self)
            
            XCTAssertEqual(users.count, 1)
        })
        
        try app.test(.DELETE, "\(usersURI)\(user1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .noContent)
        })
        
        try app.test(.GET, "\(usersURI)\(user1.id!)", afterResponse: { response in
            XCTAssertEqual(response.status, .notFound)
        })
        
        try app.test(.GET, usersURI, afterResponse: { response in
            let users = try response.content.decode([User].self)
            
            XCTAssertEqual(users.count, 0)
        })
    }
}
