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
            AuthenticationManager.shared.getCurrentUserId(completion: { userId in
                if userId == nil {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
                
                reservation.guestId = userId!
                currentUserId = userId!
                
                if reservation.ownerId == currentUserId {
                    DispatchQueue.main.async {
                        print("owner and guest are the same")
                        completion(false)
                    }
                    return
                }
                
                ReservationsAPI.addReservation(body: ReservationTransformator.transformForCreation(reservation: reservation), completion: { _, _ in
                    DispatchQueue.main.async {
                        completion(true)
                    }
                })
            })
        }
        
        if reservation.ownerId == currentUserId {
            DispatchQueue.main.async {
                print("owner and guest are the same")
                completion(false)
            }
            return
        }
        
        ReservationsAPI.addReservation(body: ReservationTransformator.transformForCreation(reservation: reservation), completion: { _, _ in
            DispatchQueue.main.async {
                completion(true)
            }
        })
        
        //let reservationRef = self.databaseRef?.child(reservation.id)
        //reservationRef?.setValue(reservation.toAnyObject())
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
        
        static func transformToClientModel(reservations: [APIReservation]) -> [Reservation] {
            var result: [Reservation] = []
            for reservation in reservations {
                result.append(ReservationTransformator.transformToClientModel(reservation: reservation))
            }
            
            return result
        }
        
        static func transformForCreation(reservation: Reservation) -> CreateReservationData {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "YY/MM/DD"
            let start = dateformatter.string(from: reservation.date.lowerBound)
            let end = dateformatter.string(from: reservation.date.upperBound)
            let result = CreateReservationData(guestId: reservation.guestId, couchId: reservation.couchId, guestsNum: reservation.guestsNum, start: start, end: end)

            return result
        }
    }
}
