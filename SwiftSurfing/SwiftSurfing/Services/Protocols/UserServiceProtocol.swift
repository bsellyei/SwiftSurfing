//
//  UserServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation

protocol UserServiceProtocol {
    
    func addNew(user: User, completion: @escaping (Bool) -> Void)
    
    func get(id: String, completion: @escaping (User?) -> Void)
    
    func getByExternalId(id: String, completion: @escaping (User?) -> Void)
}
