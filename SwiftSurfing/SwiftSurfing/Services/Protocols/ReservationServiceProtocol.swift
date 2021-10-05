//
//  ReservationServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation

protocol ReservationServiceProtocol {
    func add(reservation: Reservation, completion: @escaping (Bool) -> Void)
    
    func get(id: String, completion: @escaping (Reservation?) -> Void)
}
