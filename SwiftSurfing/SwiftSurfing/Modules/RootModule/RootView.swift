//
//  RootView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import SwiftUI

struct RootView: View {
    @ObservedObject var presenter: RootPresenter
    
    init(presenter: RootPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            if presenter.isLoggedIn {
                HomeTabView()
            } else {
                LoginView(presenter:
                    LoginPresenter(interactor:
                        LoginInteractor()))
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = RootInteractor()
        let presenter = RootPresenter(interactor: interactor)
        return RootView(presenter: presenter)
    }
}
