//
//  ReservationService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation
import Firebase
import FirebaseAuth

class ReservationService: ReservationServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Reservation")
    }
    
    func add(reservation: Reservation, completion: @escaping (Bool) -> Void) {
        if reservation.guestId.isEmpty {
            let user = Auth.auth().currentUser
            guard
                let userId = user?.uid
            else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            reservation.guestId = userId
        }
        
        let reservationRef = self.databaseRef?.child(reservation.id)
        reservationRef?.setValue(reservation.toAnyObject())
        
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func get(id: String, completion: @escaping (Reservation?) -> Void) {
        let reservationRef = databaseRef?.child(id)
        reservationRef?.observeSingleEvent(of: .value, with: { snapshot in
            let reservation = Reservation(snapshot: snapshot)
            DispatchQueue.main.async {
                completion(reservation)
            }
        })
    }
}
