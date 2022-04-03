//
//  CouchService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

class CouchService: ICouchService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getAllCouches() async throws -> [Couch] {
        return try await Couch.query(on: db).all()
    }
    
    func getCouch(id: String?) async throws -> Couch? {
        let uuid = UUID(uuidString: id!)
        let found = try await Couch.find(uuid, on: db)
        guard let couch = found else { return nil }
        
        return couch
    }
    
    func createCouch(couch: Couch) async throws -> Couch {
        try await couch.save(on: db)
        return couch
    }
    
    func deleteCouch(id: String?) async throws -> Bool {
        let found = try await getCouch(id: id)
        guard let couch = found else { return false }
        try await couch.delete(on: db)
        
        return true
    }
}
