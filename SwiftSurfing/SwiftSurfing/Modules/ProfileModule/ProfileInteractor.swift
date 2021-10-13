//
//  ProfileInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 11..
//

import Foundation
import Firebase

class ProfileInteractor {
    private var authManager: AuthenticationManager
    
    init() {
        self.authManager = AuthenticationManager.shared
    }
    
    func logout() {
        authManager.signout()
    }
}
