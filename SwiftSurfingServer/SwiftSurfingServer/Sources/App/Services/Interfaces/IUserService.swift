//
//  IUserService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 21..
//

import Foundation
import Fluent

//sourcery: AutoMockable
protocol IUserService {
    func getAllUsers() async throws -> [User]
    
    func getUser(id: String?) async throws -> User?
    
    func getUser(externalId: String?) async throws -> User? 
    
    func createUser(user: User) async throws -> User
    
    func deleteUser(id: String?) async throws -> Bool
}
