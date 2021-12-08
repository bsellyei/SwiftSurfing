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
    func boot(routes: RoutesBuilder) throws {
        let couches = routes.grouped("couches")
        couches.get("user", ":userId", use: getAllCouches)
        couches.get(":id", use: getSingleCouch)
        couches.post(use: createCouch)
        couches.delete(":id", use: deleteCouch)
    }
    
    func getAllCouches(req: Request) throws -> EventLoopFuture<[Couch]> {
        let parameter = req.parameters.get("userId")!
        let userId = UUID(uuidString: parameter)
        return Couch.query(on: req.db)
                .filter(\.$user.$id ==  userId!)
                .all()
    }
    
    func getSingleCouch(req: Request) throws -> EventLoopFuture<Couch> {
        Couch.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound))
    }
    
    func createCouch(req: Request) throws -> EventLoopFuture<Couch> {
        let data = try req.content.decode(CreateCouchData.self)
        let couch = Couch(userId: data.userId, name: data.name, address: data.address, city: data.city, country: data.country, latitude: data.latitude, longitude: data.longitude, maxGuests: data.maxGuests, description: data.description)
        return couch.save(on: req.db).map { couch }
    }
    
    func deleteCouch(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Couch.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
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
