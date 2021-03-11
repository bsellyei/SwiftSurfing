//
//  LoginInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 10..
//

import Foundation
import Firebase

class LoginInteractor: LoginInteractorInterface {
    var presenter: LoginInteractorToPresenter?
    
    init () {
        
    }
}

extension LoginInteractor: LoginPresenterToInteractor {
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                let authError = error as NSError
                switch AuthErrorCode(rawValue: authError.code) {
                case .operationNotAllowed:
                    print("Error: \(authError.localizedDescription)")
                    self.presenter?.loginDidFail()
                case .userDisabled:
                    print("Error: \(authError.localizedDescription)")
                    self.presenter?.loginDidFail()
                case .wrongPassword:
                    print("Error: \(authError.localizedDescription)")
                    self.presenter?.loginDidFail()
                case .invalidEmail:
                    print("Error: \(authError.localizedDescription)")
                    self.presenter?.loginDidFail()
                default:
                    print("Error: \(authError.localizedDescription)")
                    self.presenter?.loginDidFail()
                }
            } else {
                print("User logged in")
                self.presenter?.loginDidSucceed()
            }
        }
    }
}
