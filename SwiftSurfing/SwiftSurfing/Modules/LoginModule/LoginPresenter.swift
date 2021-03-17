//
//  LoginPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import Foundation
import SwiftUI

class LoginPresenter: ObservableObject {
    private let interactor: LoginInteractor
    private let router = LoginRouter()
    
    @Published var email: String
    @Published var password: String
    
    var disableLogin: Bool {
        email.isEmpty || password.isEmpty
    }
    
    init(interactor: LoginInteractor) {
        self.interactor = interactor
        
        self.email = ""
        self.password = ""
    }
    
    lazy var emailValidation: ValidationPublisher = {
        $email.nonEmptyValidator("There is no user registered with this email address.")
    }()
    
    func login() {
        interactor.login(email: self.email, password: self.password)
    }
    
    func loginDidFail() {
        
    }
    
    func loginDidSucceed() {
        
    }
    
    func linkBuilder<Content: View>(@ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeRegisterView()) {
            content()
        }
    }
}
