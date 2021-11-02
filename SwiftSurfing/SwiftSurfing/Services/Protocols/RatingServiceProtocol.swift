//
//  RatingServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation

protocol RatingServiceProtocol {
    func add(rating: Rating, completion: @escaping (Bool) -> Void)
    
    func getAllRatings(couchId: String, completion: @escaping ([Rating]) -> Void)
}
