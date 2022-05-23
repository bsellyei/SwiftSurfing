//
//  AuthenticationManager.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 13..
//

import Foundation
import FirebaseAuth

class AuthenticationManager: NSObject, ObservableObject {
    
    @Published var loggedInUser: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: NSError?
    
    @Published var apiUser: User?
    
    static let shared = AuthenticationManager()
    
    private let auth = Auth.auth()
    
    private let userService: UserServiceProtocol
    
    override private init() {
        userService = DIContainer.instance.resolve(type: UserServiceProtocol.self)!
        loggedInUser = auth.currentUser
        super.init()
        
        auth.addStateDidChangeListener(authStateChanged)
    }
    
    func getCurrentUserId(completion: @escaping (String?) -> Void) {
        if apiUser == nil {
            let externalId = auth.currentUser?.uid
            userService.getByExternalId(id: externalId!, completion: { user in
                self.apiUser = user
                completion(self.apiUser!.id)
            })
        } else {
            completion(apiUser!.id)
        }
    }
    
    func login(email: String, password: String) {
        self.isAuthenticating = true
        self.error = nil
        
        handleSignInWith(email: email, password: password)
    }
    
    func signup(email: String, password: String, completion: @escaping () -> Void) {
        self.isAuthenticating = true
        self.error = nil
        
        auth.createUser(withEmail: email, password: password, completion: { (auth, error) in
            self.handleAuthResultCompletion(auth: auth, error: error)
            
            DispatchQueue.main.async {
                completion()
            }
        })
    }
    
    func signout() {
        try? auth.signOut()
    }
    
    private func authStateChanged(with auth: Auth, user: FirebaseAuth.User?) {
        guard user != self.loggedInUser else { return }
        self.loggedInUser = user
    }
    
    private func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    private func handleAuthResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
            if let user = auth?.user {
                self.loggedInUser = user
            } else if let error = error {
                self.error = error as NSError
            }
        }
    }
}
