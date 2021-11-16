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
    
    func getAllUsers(req: Request) throws -> EventLoopFuture<[User]> {
        User.query(on: req.db).all()
    }
    
    func getUser(req: Request) throws -> EventLoopFuture<User> {
        User.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound))
    }
    
    func createUser(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
    }
    
    func deleteUser(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}
