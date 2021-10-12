//
//  ProfileInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 11..
//

import Foundation
import Firebase

class ProfileInteractor {
    init() {

    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
