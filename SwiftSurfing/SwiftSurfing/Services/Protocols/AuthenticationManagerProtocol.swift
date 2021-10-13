//
//  AuthenticationManagerProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 13..
//

import Foundation
import FirebaseAuth

protocol AuthenticationManagerProtocol {
    
    
    func login(email: String, password: String)
    
    func signup(email: String, password: String, completion: @escaping () -> Void)
    
    func signout()
}
