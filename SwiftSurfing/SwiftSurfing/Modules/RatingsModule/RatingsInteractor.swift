//
//  RatingsInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation

class RatingsInteractor {
    private let ratingsService: RatingServiceProtocol
    private let couchService: CouchServiceProtocol
    private let userService: UserServiceProtocol
    
    private var sum: Int
    private var count: Int
    private var oneSum: Int
    private var twoSum: Int
    private var threeSum: Int
    private var fourSum: Int
    private var fiveSum: Int
    
    init(ratingsService: RatingServiceProtocol, couchService: CouchServiceProtocol, userService: UserServiceProtocol) {
        self.ratingsService = ratingsService
        self.couchService = couchService
        self.userService = userService
        self.sum = 0
        self.count = 0
        self.oneSum = 0
        self.twoSum = 0
        self.threeSum = 0
        self.fourSum = 0
        self.fiveSum = 0
    }
    
    func getRatings(couchId: String, completion: @escaping ([Rating], RatingSummaryViewContext) -> Void) {
        self.ratingsService.getAllRatings(couchId: couchId, completion: { ratings in
            self.sum = 0
            for rating in ratings {
                self.sum += rating.value
            }
            
            self.count = ratings.count

            self.oneSum = ratings.filter({  $0.value == 1 }).count
            self.twoSum = ratings.filter({  $0.value == 2 }).count
            self.threeSum = ratings.filter({  $0.value == 3 }).count
            self.fourSum = ratings.filter({  $0.value == 4 }).count
            self.fiveSum = ratings.filter({  $0.value == 5 }).count
            
            var ctx = RatingSummaryViewContext(average: 0, oneRatingPercent: 0.0, twoRatingPercent: 0.0, threeRatingPercent: 0.0, fourRatingPercent: 0.0, fiveRatingPercent: 0.0)
            if self.count != 0 {
                let onePercent = Double(self.oneSum) / Double(self.count)
                let twoPercent = Double(self.twoSum) / Double(self.count)
                let threePercent = Double(self.threeSum) / Double(self.count)
                let fourPercent = Double(self.fourSum) / Double(self.count)
                let fivePercent = Double(self.fiveSum) / Double(self.count)
                ctx = RatingSummaryViewContext(average: self.sum / self.count, oneRatingPercent: onePercent, twoRatingPercent: twoPercent, threeRatingPercent: threePercent, fourRatingPercent: fourPercent, fiveRatingPercent: fivePercent)
            }
            
            DispatchQueue.main.async {
                completion(ratings, ctx)
            }
        })
    }
    
    func sendRating(rating: Rating, completion: @escaping (RatingSummaryViewContext) -> Void) {
        self.ratingsService.add(rating: rating, completion: { success in
            var ctx = RatingSummaryViewContext(average: 0, oneRatingPercent: 0, twoRatingPercent: 0, threeRatingPercent: 0, fourRatingPercent: 0, fiveRatingPercent: 0)
            
            if success {
                self.couchService.get(id: rating.couchId, completion: { couch in
                    if let couch = couch {
                        
                        let sum = couch.ratingCount == 0 ? rating.value : couch.ratingAverage * couch.ratingCount
                        couch.ratingCount += 1
                        couch.ratingAverage = sum / (couch.ratingCount)
                        
                        self.couchService.update(couch: couch, completion: { success in
                            if rating.value == 1 {
                                self.oneSum += 1
                            } else if rating.value == 2 {
                                self.twoSum += 1
                            } else if rating.value == 3 {
                                self.threeSum += 1
                            } else if rating.value == 4 {
                                self.fourSum += 1
                            } else {
                                self.fiveSum += 1
                            }
                            
                            self.sum += rating.value
                            self.count += 1
                            
                            ctx.average = self.sum / self.count
                            ctx.oneRatingPercent = Double(self.oneSum / self.count)
                            ctx.twoRatingPercent = Double(self.twoSum / self.count)
                            ctx.threeRatingPercent = Double(self.threeSum / self.count)
                            ctx.fourRatingPercent = Double(self.fourSum / self.count)
                            ctx.fiveRatingPercent = Double(self.fiveSum / self.count)
                            
                            DispatchQueue.main.async {
                                completion(ctx)
                            }
                        })
                    } else {
                        DispatchQueue.main.async {
                            completion(ctx)
                        }
                    }
                })
            } else {
                if self.count != 0 {
                    ctx = RatingSummaryViewContext(average: self.sum / self.count, oneRatingPercent: Double(self.oneSum / self.count), twoRatingPercent: Double(self.twoSum / self.count), threeRatingPercent: Double(self.threeSum / self.count), fourRatingPercent: Double(self.fourSum / self.count), fiveRatingPercent: Double(self.fiveSum / self.count))
                }
                
                DispatchQueue.main.async {
                    completion(ctx)
                }
            }
        })
    }
    
    func getUsers(ratings: [Rating], completion: @escaping (String, String) -> Void) {        
        for rating in ratings {
            self.userService.get(id: rating.userId, completion: { user in
                guard let userName = user else { return }
                
                DispatchQueue.main.async {
                    completion(rating.id, userName.fullName)
                }
            })
        }
    }
}
