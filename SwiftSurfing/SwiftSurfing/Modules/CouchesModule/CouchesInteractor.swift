//
//  CouchesInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation

class CouchesInteractor {
    private let service: CouchServiceProtocol
    
    init(couchService: CouchServiceProtocol) {
        self.service = couchService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        service.getAllCouches(completion: completion)
    }
}
