//
//  RootInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 14..
//

import Foundation
import Firebase

class RootInteractor {
    init() {
        
    }
    
    func isLoggedIn() -> Bool {
        let userInfo = Auth.auth().currentUser
        return userInfo != nil
    }
}
