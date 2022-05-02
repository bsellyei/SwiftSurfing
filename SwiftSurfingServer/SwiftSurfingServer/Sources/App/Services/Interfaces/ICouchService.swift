//
//  ICouchService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

//sourcery: AutoMockable
protocol ICouchService {
    func getAllCouchesForUser(userId: String?) async throws -> [Couch]
    
    func getAllCouchesByCity(city: String?, userId: String?) async throws -> [Couch]
    
    func getCouch(id: String?) async throws -> Couch?
    
    func createCouch(couch: Couch) async throws -> Couch
    
    func deleteCouch(id: String?) async throws -> Bool
}
