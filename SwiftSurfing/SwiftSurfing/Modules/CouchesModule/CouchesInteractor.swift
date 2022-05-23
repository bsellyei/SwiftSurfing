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
        AuthenticationManager.shared.getCurrentUserId(completion: { userId in
            if userId == nil {
                DispatchQueue.main.async {
                    completion("")
                }
            } else {
                self.userService.get(id: userId!, completion: { user in
                    if user == nil {
                        DispatchQueue.main.async {
                            completion("")
                        }
                    }
                        
                    DispatchQueue.main.async {
                        completion(user!.fullName)
                    }
                })
            }
        })
    }
}
