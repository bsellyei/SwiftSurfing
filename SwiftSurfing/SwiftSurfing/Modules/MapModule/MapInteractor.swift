//
//  MapInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import Foundation

class MapInteractor {
    private let service: CouchServiceProtocol
    
    init(couchService: CouchServiceProtocol) {
        self.service = couchService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        service.getAllCouches(completion: completion)
    }
}
