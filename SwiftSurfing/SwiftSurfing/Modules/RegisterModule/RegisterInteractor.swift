//
//  RegisterInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import Foundation
import Firebase

class RegisterInteractor {
    private let service: UserServiceProtocol
    private var authManager: AuthenticationManager
    
    init(service: UserServiceProtocol) {
        self.service = service
        self.authManager = AuthenticationManager.shared
    }
    
    func register(email: String, password: String, fullName: String) {
        authManager.signup(email: email, password: password, completion: {
            let user = User()
            
            if let userId = self.authManager.loggedInUser?.uid,
               let userEmail = self.authManager.loggedInUser?.email
            {
                user.email = userEmail
                user.fullName = fullName
                
                self.service.addNew(user: user, completion: { success in
                    if success {
                        self.service.getByExternalId(id: userId, completion: { user in
                            self.authManager.apiUser = user
                        })
                    }
                })
            }
        })
    }
}
