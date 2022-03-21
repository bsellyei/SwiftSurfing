//
//  RatingController.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 23..
//

import Foundation
import Vapor
import Fluent

struct RatingController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let ratings = routes.grouped("ratings")
        ratings.get(":couchId", use: getRatings)
        ratings.post(use: createRating)
        ratings.delete(":id", use: deleteRating)
    }
    
    func getRatings(req: Request) async throws -> [Rating] {
        let parameter = req.parameters.get("couchId")!
        let couchId = UUID(uuidString: parameter)
        return try await Rating.query(on: req.db)
                .filter(\.$couch.$id == couchId!)
                .all()
    }
    
    func createRating(req: Request) async throws -> Rating {
        let data = try req.content.decode(CreateRatingData.self)
        let rating = Rating(userId: data.userId, couchId: data.couchId, value: data.value, comment: data.comment)
        try await rating.save(on: req.db)
        
        return rating
    }
    
    func deleteRating(req: Request) async throws -> HTTPStatus {
        let found = try await Rating.find(req.parameters.get("id"), on: req.db)
        guard let rating = found else { throw Abort(.notFound) }
        try await rating.delete(on: req.db)
        
        return .noContent
    }
}

struct CreateRatingData: Content {
    let userId: UUID
    let couchId: UUID
    let value: Int
    let comment: String
}
