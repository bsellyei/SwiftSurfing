//
//  CouchController.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor

struct CouchController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let couches = routes.grouped("couches")
    }
}
