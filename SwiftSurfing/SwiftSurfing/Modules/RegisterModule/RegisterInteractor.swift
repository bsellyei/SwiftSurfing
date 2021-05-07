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
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let authError = error as NSError
                switch AuthErrorCode(rawValue: authError.code) {
                case .operationNotAllowed:
                    print("Error: \(authError.localizedDescription)")
                case .emailAlreadyInUse:
                    print("Error: \(authError.localizedDescription)")
                case .invalidEmail:
                    print("Error: \(authError.localizedDescription)")
                case .weakPassword:
                    print("Error: \(authError.localizedDescription)")
                default:
                    print("Error: \(authError.localizedDescription)")
                }
            } else {
                print("User signed up successfully")
                let user = User()
                if let userId = Auth.auth().currentUser?.uid,
                   let fullName = Auth.auth().currentUser?.displayName,
                   let email = Auth.auth().currentUser?.email
                {
                    user.id = userId
                    user.fullName = fullName
                    user.email = email
                }
            
                self.service.addNew(user: user) { success in
                    print("User added to database")
                }
            }
        }
        
    }
}
