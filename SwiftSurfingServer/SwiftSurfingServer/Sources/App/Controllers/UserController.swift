//
//  UserController.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: getAllUsers)
        users.get(":id", use: getUser)
        users.post(use: createUser)
        users.delete(":id", use: deleteUser)
    }
    
    func getAllUsers(req: Request) async throws -> [User] {
        return try await User.query(on: req.db).all()
    }
    
    func getUser(req: Request) async throws -> User {
        let found = try await User.find(req.parameters.get("id"), on: req.db)
        guard let user = found else { throw Abort(.notFound) }
        return user
    }
    
    func createUser(req: Request) async throws -> User {
        let user = try req.content.decode(User.self)
        try await user.save(on: req.db)
        
        return user
    }
    
    func deleteUser(req: Request) async throws -> HTTPStatus {
        let found = try await User.find(req.parameters.get("id"), on: req.db)
        guard let user = found else { throw Abort(.notFound) }
        try await user.delete(on: req.db)
        
        return .noContent
    }
}
