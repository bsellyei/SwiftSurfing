//
//  CouchServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 24..
//

import Foundation
import Firebase

protocol CouchServiceProtocol {
    var databaseRef: DatabaseReference? { get set }
    
    func addNew(couch: Couch, completion: @escaping (Bool) -> Void)
    
    func get(couch: Couch)
    
    func getAllCouches(completion: @escaping ([Couch]) -> Void)
    
    func update(couch: Couch, completion: @escaping (Bool) -> Void)
    
    func delete(couch: Couch)
}
