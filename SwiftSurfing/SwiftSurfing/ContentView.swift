//
//  ContentView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 02. 24..
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        Group {
            if authManager.loggedInUser != nil {
                HomeTabView()
            } else {
                LoginView(presenter: LoginPresenter(interactor: LoginInteractor()))
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
