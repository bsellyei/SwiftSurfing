//
//  NewCouchInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import Firebase
import CoreData

class NewCouchInteractor {
    private let service: CouchServiceProtocol
    
    init(couchService: CouchServiceProtocol) {
        self.service = couchService
    }
    
    func addNew(couch: Couch, completion: @escaping (Bool) -> Void) {
        return service.addNew(couch: couch, completion: completion)
    }
}
