//
//  LoginRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import Foundation
import SwiftUI

class LoginRouter {
    func makeRegisterView() -> some View {
        let interactor = RegisterInteractor(service: DIContainer.instance.resolve(type: UserServiceProtocol.self)!)
        let presenter = RegisterPresenter(interactor: interactor)
        return RegisterView(presenter: presenter)
    }
}
