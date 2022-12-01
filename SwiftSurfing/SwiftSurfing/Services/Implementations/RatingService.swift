//
//  RatingService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation
import Firebase

class RatingService: RatingServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Rating")
    }
    
    func add(rating: Rating, completion: @escaping (Bool) -> Void) {
        if rating.userId.isEmpty {
            AuthenticationManager.shared.getCurrentUserId(completion: { userId in
                if userId == nil {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                    return
                }
                
                rating.userId = userId!
                
                RatingAPI.createRating(body: RatingTransformator.transformForCreation(rating: rating), completion: { _, _ in
                    DispatchQueue.main.async {
                        completion(true)
                    }
                })
            })
        }
    }
    
    func getAllRatings(couchId: String, completion: @escaping ([Rating]) -> Void) {        
        RatingAPI.getRatings(_id: couchId, completion: { ratings, _ in
            DispatchQueue.main.async {
                completion(RatingTransformator.transformToClientModel(ratings: ratings!))
            }
        })
    }
    
    class RatingTransformator {
        static func transformToClientModel(rating: APIRating) -> Rating {
            let result = Rating()
            result.id = rating._id!
            result.userId = (rating.user?._id)!
            result.couchId = (rating.couch?._id)!
            result.value = rating.value!
            result.comment = rating.comment!
            return result
        }
        
        static func transformToAPIModel(rating: Rating) -> APIRating {
            let result = APIRating(_id: rating.id, user: APIUser(_id: rating.userId, fullName: "", email: ""), couch: APICouch(_id: rating.couchId, name: "", address: "", city: "", country: "", latitude: nil, longitude: nil, maxGuests: nil, _description: "", imageUrls: [], ratingAverage: nil, ratingCount: nil, user: nil), value: rating.value, comment: rating.comment)
            return result
        }
        
        static func transformToClientModel(ratings: [APIRating]) -> [Rating] {
            var result: [Rating] = []
            for rating in ratings {
                result.append(RatingTransformator.transformToClientModel(rating: rating))
            }
            
            return result
        }
        
        static func transformForCreation(rating: Rating) -> CreateRatingData {
            let result = CreateRatingData(userId: rating.userId, couchId: rating.couchId, value: rating.value, comment: rating.comment)
            return result
        }
    }
}
