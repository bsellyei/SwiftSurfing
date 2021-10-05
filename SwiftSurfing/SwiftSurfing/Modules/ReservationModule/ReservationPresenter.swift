//
//  ReservationPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation

class ReservationPresenter: ObservableObject {
    private let interactor: ReservationInteractor
    
    @Published var owner: User
    @Published var couch: Couch
    @Published var reservation: Reservation
    let maxGuests: Int
    
    init(interactor: ReservationInteractor, reservation: Reservation) {
        self.interactor = interactor
        self.owner = User()
        self.couch = Couch()
        self.reservation = reservation
        self.maxGuests = reservation.guestsNum
    }
    
    func loadData() {
        getOwner()
        getCouch()
    }
    
    func add() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.addReservation(reservation: self.reservation, completion: {  _ in
                
            })
        }
    }
    
    private func getOwner() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getOwner(ownerId: self.reservation.ownerId, completion: { owner in
                self.owner = owner ?? User()
            })
        }
    }
    
    private func getCouch() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getCouch(couchId: self.reservation.couchId, completion: { couch in
                self.couch = couch ?? Couch()
            })
        }
    }
}
