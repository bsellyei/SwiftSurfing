//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

class RatingService: IRatingService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getRatings(couchId: String?) async throws -> [Rating] {
        let uuid = UUID(uuidString: couchId!)
        return try await Rating.query(on: db)
            .filter(\.$couch.$id == uuid!)
            .all()
    }
    
    func createRating(rating: Rating) async throws -> Rating {
        try await rating.save(on: db)
        return rating
    }
    
    func deleteRating(id: String?) async throws -> Bool {
        let uuid = UUID(uuidString: id!)
        let found = try await Rating.find(uuid, on: db)
        guard let rating = found else { return false }
        try await rating.delete(on: db)
        
        return true
    }
}
