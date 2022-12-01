//
//  UserService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation
import FirebaseDatabase
import CloudKit

class UserService: UserServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "User")
    }
    
    func addNew(user: User, completion: @escaping (Bool) -> Void) {        
        UserAPI.addUser(body: UserTransformator.transformToAPIModel(user: user), completion: { _, _ in
            DispatchQueue.main.async {
                completion(true)
            }
        })
    }
    
    func get(id: String, completion: @escaping (User?) -> Void) {
        UserAPI.getUserById(_id: id, completion: { user, _ in
            DispatchQueue.main.async {
                completion(UserTransformator.transformToClientModel(user: user!))
            }
        })
    }
    
    func getByExternalId(id: String, completion: @escaping (User?) -> Void) {
        UserAPI.getUserByExternalId(externalId: id, completion: { user, _ in
            DispatchQueue.main.async {
                completion(UserTransformator.transformToClientModel(user: user!))
            }
        })
    }
    
    class UserTransformator {
        static func transformToClientModel(user: APIUser) -> User {
            let result = User()
            result.id = user._id!
            result.fullName = user.fullName!
            result.email = user.email!
            return result
        }
        
        static func transformToAPIModel(user: User) -> APIUser {
            let result = APIUser(_id: user.id, fullName: user.fullName, email: user.email)
            return result
        }
    }
}
