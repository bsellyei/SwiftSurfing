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
        var currentUserId = ""
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
            currentUserId = userId
        }
        
        if reservation.ownerId == currentUserId {
            DispatchQueue.main.async {
                print("owner and guest are the same")
                completion(false)
            }
            return
        }
        
        //let reservationRef = self.databaseRef?.child(reservation.id)
        //reservationRef?.setValue(reservation.toAnyObject())
        
        ReservationsAPI.addReservation(body: ReservationTransformator.transformToAPIModel(reservation: reservation), completion: { _, _ in
            DispatchQueue.main.async {
                completion(true)
            }
        })
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
    
    class ReservationTransformator {
        static func transformToClientModel(reservation: APIReservation) -> Reservation {
            let result = Reservation()
            result.id = reservation._id!
            result.guestId = reservation.user?._id ?? ""
            result.couchId = reservation.couch?._id! ?? ""
            result.guestsNum = reservation.guestsNum!
            result.date = ClosedRange<Date>(uncheckedBounds: (lower: reservation.start!, upper: reservation.end!))
            return result
        }
        
        static func transformToAPIModel(reservation: Reservation) -> APIReservation {
            let result = APIReservation(_id: reservation.id, user: APIUser(_id: reservation.guestId, fullName: "", email: ""), couch: APICouch(_id: reservation.couchId, name: "", address: "", city: "", country: "", latitude: 0, longitude: 0, maxGuests: 0, _description: "", imageUrls: [], ratingAverage: 0, ratingCount: 0, user: APIUser(_id: "", fullName: "", email: "")), guestsNum: reservation.guestsNum, start: reservation.date.lowerBound, end: reservation.date.upperBound)
            
            return result
        }
        
        static func transformToClientModel(reservations: [APIReservation]) -> [Reservation] {
            var result: [Reservation] = []
            for reservation in reservations {
                result.append(ReservationTransformator.transformToClientModel(reservation: reservation))
            }
            
            return result
        }
    }
}
