//
//  ReservationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 02..
//

import Foundation
import Fluent

class ReservationService: IReservationService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func createReservation(reservation: Reservation) async throws -> Reservation {
        try await reservation.save(on: db)
        return reservation
    }
    
    func getReservations(user: User) async throws -> [Reservation] {
        return try await user.$reservations.query(on: db).all()
    }
    
    func getReservations(couchId: String?) async throws -> [Reservation] {
        let uuid = UUID(uuidString: couchId!)
        return try await Reservation.query(on: db)
            .filter(\.$couch.$id == uuid!)
            .all()
    }
}
