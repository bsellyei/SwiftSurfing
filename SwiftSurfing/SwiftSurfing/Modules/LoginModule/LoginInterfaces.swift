//
//  LoginInterfaces.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 10..
//

import Foundation

protocol LoginInteractorInterface: class {
    var presenter: LoginInteractorToPresenter? { set get }
}

protocol LoginInteractorToPresenter: class {
    func loginDidSucceed()
    func loginDidFail()
}

protocol LoginPresenterInterface: class {
    var view: LoginView { get set }
    var interactor: LoginPresenterToInteractor { get set }
}

protocol LoginPresenterToInteractor: class {
    func login(email: String, password: String)
}

protocol LoginViewToPresenter: class {
    var email: String { get set }
    var password: String { get set }
    
    func login()
}

protocol LoginPresenterToView: class {
    func displayLoginSuccess()
    func displayLoginFail()
}
