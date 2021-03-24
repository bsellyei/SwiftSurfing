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
    
    func addNew(couch: Couch)
    
    func get(couch: Couch)
    
    func getAllCouches()
    
    func update(couch: Couch)
    
    func delete(couch: Couch)
}
