//
//  UserServiceTest.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 22..
//

@testable import App
import XCTVapor
import Foundation
import SwiftyMocky

let uuid1 = UUID()
let uuidString1 = uuid1.uuidString
let user1 = User(id: uuid1, fullName: "user1", email: "user1@test.com")

final class UserServiceTests: XCTestCase {
    
    override func setUp() {
        setUpEnvironment()
    }

    func testGetAllUsersEmpty() async throws {
        let userServiceMock = IUserServiceMock()
        
        Given(userServiceMock, .getAllUsers(willReturn: []))
        XCTAssertEqual(try userServiceMock.getAllUsers().count, 0)
    }
    
    func testGetAllUsers() async throws {
        let userServiceMock = IUserServiceMock()
        let user2 = User(fullName: "user2", email: "user2@test.com")
        
        Given(userServiceMock, .getAllUsers(willReturn: [user1]))
        var users = try userServiceMock.getAllUsers()
        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users[0].fullName, user1.fullName)
        XCTAssertEqual(users[0].email, user1.email)
        
        Given(userServiceMock, .getAllUsers(willReturn: [user1, user2]))
        users = try userServiceMock.getAllUsers()
        XCTAssertEqual(users.count, 2)
        XCTAssertEqual(users[0].fullName, user1.fullName)
        XCTAssertEqual(users[0].email, user1.email)
        XCTAssertEqual(users[1].fullName, user2.fullName)
        XCTAssertEqual(users[1].email, user2.email)
    }
    
    func testGetUser() async throws {
        let userServiceMock = IUserServiceMock()
        
        Given(userServiceMock, .getUser(id: .value(uuidString1), willReturn: user1))
        let result = try userServiceMock.getUser(id: uuidString1)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, uuid1)
        XCTAssertEqual(result?.fullName, user1.fullName)
        XCTAssertEqual(result?.email, user1.email)
    }
    
    func testGetUserNotFound() async throws {
        let userServiceMock = IUserServiceMock()
        
        Given(userServiceMock, .getUser(id: .value(uuidString1), willReturn: nil))
        XCTAssertNil(try userServiceMock.getUser(id: uuidString1))
    }
    
    func testCreateUser() async throws {
        let userServiceMock = IUserServiceMock()
        
        Given(userServiceMock, .createUser(user: .value(user1), willReturn: user1))
        let created = try userServiceMock.createUser(user: user1)
        XCTAssertNotNil(created)
        
        Given(userServiceMock, .getUser(id: .value(uuidString1), willReturn: user1))
        let user = try userServiceMock.getUser(id: uuidString1)
        XCTAssertEqual(user?.id, created.id)
        XCTAssertEqual(user?.fullName, created.fullName)
        XCTAssertEqual(user?.email, created.email)
    }
    
    func testDeleteFail() async throws {
        let userServiceMock = IUserServiceMock()
        
        Given(userServiceMock, .deleteUser(id: .value(uuidString1), willReturn: false))
        XCTAssertFalse(try userServiceMock.deleteUser(id: uuidString1))
    }
    
    func testDeleteSucceed() async throws {
        let userServiceMock = IUserServiceMock()

        Given(userServiceMock, .createUser(user: .value(user1), willReturn: user1))
        let _ = try userServiceMock.createUser(user: user1)
        
        Given(userServiceMock, .deleteUser(id: .value(uuidString1), willReturn: true))
        XCTAssertTrue(try userServiceMock.deleteUser(id: uuidString1))
    }
    
    func setUpEnvironment() {
        Matcher.default.register(User.self) { (lhs, rhs) -> Bool in
            guard lhs.id == rhs.id else { return false }
            guard lhs.fullName == rhs.fullName else { return false }
            guard lhs.email == rhs.email else { return false }
            return true
        }
    }
}
