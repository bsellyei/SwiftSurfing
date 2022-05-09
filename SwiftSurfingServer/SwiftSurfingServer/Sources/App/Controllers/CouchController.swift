//
//  CouchController.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import Foundation
import Vapor
import Fluent

struct CouchController: RouteCollection {
    let couchService: ICouchService
    let homeConfigurationService: IHomeConfigurationService
    
    init(couchService: ICouchService, homeConfigurationService: IHomeConfigurationService) {
        self.couchService = couchService
        self.homeConfigurationService = homeConfigurationService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let couches = routes.grouped("couches")
        couches.get("user", ":userId", use: getAllCouchesForUser)
        couches.get("city", ":city", ":userId", use: getAllCouchesByCityExceptUserId)
        couches.get(":id", use: getCouch)
        couches.post(use: createCouch)
        couches.delete(":id", use: deleteCouch)
    }
    
    func getAllCouchesForUser(req: Request) async throws -> [Couch] {
        return try await couchService.getAllCouchesForUser(userId: req.parameters.get("userId"))
    }
    
    func getAllCouchesByCityExceptUserId(req: Request) async throws -> [Couch] {
        return try await couchService.getAllCouchesByCity(city: req.parameters.get("city"), userId: req.parameters.get("userId"))
    }
    
    func getCouch(req: Request) async throws -> Couch {
        let found = try await couchService.getCouch(id: req.parameters.get("id"))
        guard let couch = found else { throw Abort(.notFound) }
        return couch
    }
    
    func createCouch(req: Request) async throws -> Couch {
        let data = try req.content.decode(CreateCouchData.self)
        let couch = Couch(userId: data.userId, name: data.name, address: data.address, city: data.city, country: data.country, latitude: data.latitude, longitude: data.longitude, maxGuests: data.maxGuests, description: data.description)
        
        _ = try await couchService.createCouch(couch: couch)
        
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: HomeConfiguration(couchId: couch.id!, type: .heating, state: .off))
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: HomeConfiguration(couchId: couch.id!, type: .cooling, state: .off))
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: HomeConfiguration(couchId: couch.id!, type: .weatherWatcher, state: .off))
        
        return couch
    }
    
    func deleteCouch(req: Request) async throws -> HTTPStatus {
        let success = try await couchService.deleteCouch(id: req.parameters.get("id"))
        if !success { throw Abort(.notFound) }
        return .noContent
    }
}

struct CreateCouchData: Content {
    let userId: UUID
    let name: String
    let address: String
    let city: String
    let country: String
    let latitude: Double
    let longitude: Double
    let maxGuests: Int
    let description: String
}
