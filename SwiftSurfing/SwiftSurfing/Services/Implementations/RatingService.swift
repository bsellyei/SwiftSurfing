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
            let user = Auth.auth().currentUser
            guard
                let userId = user?.uid
            else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            rating.userId = userId
        }
        
        let ratingRef = self.databaseRef?.child(rating.id)
        ratingRef?.setValue(rating.toAnyObject())
        
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func getAllRatings(couchId: String, completion: @escaping ([Rating]) -> Void) {
        databaseRef?.queryOrdered(byChild: "couchId").queryEqual(toValue: couchId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let ratings = snapshot.reversed().compactMap(Rating.init)
            DispatchQueue.main.async {
                completion(ratings)
            }
        })
    }
    
    
}
