//
//  UserService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 21..
//

import Foundation
import Fluent

class UserService: IUserService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getAllUsers() async throws -> [User] {
        return try await User.query(on: db).all()
    }
    
    func getUser(id: String?) async throws -> User? {
        let uuid = UUID(uuidString: id!)
        let found = try await User.find(uuid, on: db)
        guard let user = found else { return nil }
        
        return user
    }
    
    func createUser(user: User) async throws -> User {
        try await user.save(on: db)
        return user
    }
    
    func deleteUser(id: String?) async throws -> Bool {
        let found = try await getUser(id: id)
        guard let user = found else { return false }
        try await user.delete(on: db)
        
        return true
    }
}
