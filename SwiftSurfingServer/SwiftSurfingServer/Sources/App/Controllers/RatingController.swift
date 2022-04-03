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
    let ratingService: IRatingService
    
    init(ratingService: IRatingService) {
        self.ratingService = ratingService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let ratings = routes.grouped("ratings")
        ratings.get(":couchId", use: getRatings)
        ratings.post(use: createRating)
        ratings.delete(":id", use: deleteRating)
    }
    
    func getRatings(req: Request) async throws -> [Rating] {
        return try await ratingService.getRatings(couchId: req.parameters.get("couchId"))
    }
    
    func createRating(req: Request) async throws -> Rating {
        let data = try req.content.decode(CreateRatingData.self)
        let rating = Rating(userId: data.userId, couchId: data.couchId, value: data.value, comment: data.comment)
        
        _ = try await ratingService.createRating(rating: rating)
        return rating
    }
    
    func deleteRating(req: Request) async throws -> HTTPStatus {
        let success = try await ratingService.deleteRating(id: req.parameters.get("id"))
        if !success { throw Abort(.notFound) }
        return .noContent
    }
}

struct CreateRatingData: Content {
    let userId: UUID
    let couchId: UUID
    let value: Int
    let comment: String
}
