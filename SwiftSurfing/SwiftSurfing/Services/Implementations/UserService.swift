//
//  UserService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation
import FirebaseDatabase

class UserService: UserServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "User")
    }
    
    func addNew(user: User, completion: @escaping (Bool) -> Void) {
        let userRef = databaseRef?.child(user.id)
        userRef?.setValue(user.toAnyObject()) { (error, ref) in
            if error != nil {
                return completion(false)
            }
            
            userRef?.observeSingleEvent(of: .value, with: { snapshot in
                let _ = User(snapshot: snapshot)
                DispatchQueue.main.async {
                    completion(true)
                }
            })
        }
    }
    
    func get(id: String, completion: @escaping (User?) -> Void) {
        let userRef = databaseRef?.child(id)
        userRef?.observeSingleEvent(of: .value, with: { snapshot in
            let user = User(snapshot: snapshot)
            DispatchQueue.main.async {
                completion(user)
            }
        })
    }
    
    
}
