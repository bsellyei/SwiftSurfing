//
//  RegisterPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import Foundation

class RegisterPresenter: ObservableObject {
    private let interactor: RegisterInteractor
    
    @Published var firstName: String
    @Published var surname: String
    @Published var email: String
    @Published var password: String
    
    init (interactor: RegisterInteractor) {
        self.interactor = interactor
        self.firstName = ""
        self.surname = ""
        self.email = ""
        self.password = ""
    }
    
    func register() {
        interactor.register(email: email, password: password, fullName: firstName + surname)
    }
}
