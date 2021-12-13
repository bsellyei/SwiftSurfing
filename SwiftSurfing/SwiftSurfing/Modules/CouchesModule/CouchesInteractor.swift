//
//  CouchesInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import FirebaseAuth

class CouchesInteractor {
    private let couchService: CouchServiceProtocol
    private let userService: UserServiceProtocol
    
    init(couchService: CouchServiceProtocol, userService: UserServiceProtocol) {
        self.couchService = couchService
        self.userService = userService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        self.couchService.getAllCouches(completion: completion)
    }
    
    func getUserName(completion: @escaping (String) -> Void) {
        let user = Auth.auth().currentUser
        guard let userId = user?.uid else { return }
        
        self.userService.get(id: userId, completion: { user in
            guard
                let userName = user
            else { return }
                
            DispatchQueue.main.async {
                completion(userName.fullName)
            }
        })
    }
}
