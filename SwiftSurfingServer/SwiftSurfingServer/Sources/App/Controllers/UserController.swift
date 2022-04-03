//
//  UserController.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    let userService: IUserService
    
    init(userService: IUserService) {
        self.userService = userService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: getAllUsers)
        users.get(":id", use: getUser)
        users.post(use: createUser)
        users.delete(":id", use: deleteUser)
    }
    
    func getAllUsers(req: Request) async throws -> [User] {
        return try await userService.getAllUsers()
    }
    
    func getUser(req: Request) async throws -> User {
        let found = try await userService.getUser(id: req.parameters.get("id"))
        guard let user = found else { throw Abort(.notFound) }

        return user
    }
    
    func createUser(req: Request) async throws -> User {
        let user = try req.content.decode(User.self)
        _ = try await userService.createUser(user: user)
        
        return user
    }
    
    func deleteUser(req: Request) async throws -> HTTPStatus {
        let success = try await userService.deleteUser(id: req.parameters.get("id"))
        if !success { throw Abort(.notFound) }
        
        return .noContent
    }
}
