//
//  RatingsPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation
import SwiftUI

class RatingsPresenter: ObservableObject {
    private var interactor: RatingsInteractor
    
    private let couchId: String
    var users: [User] = []
    @Published var ratings: [Rating] = []
    @Published var summary: RatingSummaryViewContext
    
    @Published var ratingCreationValue: Int
    @Published var ratingCreationComment: String
    
    init(interactor: RatingsInteractor, couchId: String) {
        self.interactor = interactor
        self.couchId = couchId
        
        self.summary = RatingSummaryViewContext(average: 0, oneRatingPercent: 0, twoRatingPercent: 0, threeRatingPercent: 0, fourRatingPercent: 0, fiveRatingPercent: 0)
        
        self.ratingCreationValue = 5
        self.ratingCreationComment = ""
    }
    
    func getRatings() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getRatings(couchId: self.couchId, completion: { ratings, ctx in
                self.ratings = ratings
                self.summary = ctx
                
                self.interactor.getUsers(ratings: ratings, completion: { users in
                    self.users = users
                })
            })
        }
    }
    
    func sendRating() {
        let rating = Rating()
        rating.couchId = couchId
        rating.value = ratingCreationValue
        rating.comment = ratingCreationComment
        
        DispatchQueue.global(qos: .background).async {
            self.interactor.sendRating(rating: rating, completion: { ctx in
                self.ratings.append(rating)
                self.summary = ctx
            })
        }
    }
    
    func getUserName(userId: String) -> String {
        for user in users {
            if user.id == userId {
                return user.fullName
            }
        }
        
        return ""
    }
}
