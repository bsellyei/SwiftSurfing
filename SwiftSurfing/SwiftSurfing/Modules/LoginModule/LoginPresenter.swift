//
//  LoginPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import Foundation

class LoginPresenter: LoginPresenterInterface, ObservableObject {
    var view: LoginView
    var interactor: LoginPresenterToInteractor
    
    init(interactor: LoginPresenterToInteractor) {
        self.interactor = interactor
    }
    
    func login() {
        interactor.login(email: email, password: password)
    }
}

extension LoginPresenter: LoginInteractorToPresenter {
    func loginDidFail() {
        
    }
    
    func loginDidSucceed() {
        <#code#>
    }
}
