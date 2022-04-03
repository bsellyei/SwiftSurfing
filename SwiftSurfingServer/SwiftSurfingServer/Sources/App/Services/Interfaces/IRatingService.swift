//
//  IRatingService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 30..
//

import Foundation
import Fluent

//sourcery: AutoMockable
protocol IRatingService {
    func getRatings(couchId: String?) async throws -> [Rating]
    
    func createRating(rating: Rating) async throws -> Rating
    
    func deleteRating(id: String?) async throws -> Bool
}
