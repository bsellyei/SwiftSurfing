//
//  IReservationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 02..
//

import Foundation

//sourcery: AutoMockable
protocol IReservationService {
    func createReservation(reservation: Reservation) async throws -> Reservation
    
    func getReservations(user: User) async throws -> [Reservation]
    
    func getReservations(couchId: String?) async throws -> [Reservation]
}
