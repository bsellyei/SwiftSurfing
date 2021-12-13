//
//  CouchDetailsInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation

class CouchDetailsInteractor {
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func getUser(userId: String, completion: @escaping (User?) -> Void) {
        self.userService.get(id: userId, completion: completion)
    }
}
