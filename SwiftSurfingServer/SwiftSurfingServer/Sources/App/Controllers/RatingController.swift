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
    
    func getRatings(req: Request) throws -> EventLoopFuture<[Rating]> {
        let parameter = req.parameters.get("couchId")!
        let couchId = UUID(uuidString: parameter)
        return Rating.query(on: req.db)
                .filter(\.$couch.$id == couchId!)
                .all()
    }
    
    func createRating(req: Request) throws -> EventLoopFuture<Rating> {
        let data = try req.content.decode(CreateRatingData.self)
        let rating = Rating(userId: data.userId, couchId: data.couchId, value: data.value, comment: data.comment)
        return rating.save(on: req.db).map { rating }
    }
    
    func deleteRating(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Rating.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}

struct CreateRatingData: Content {
    let userId: UUID
    let couchId: UUID
    let value: Int
    let comment: String
}
