//
//  ReservationInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation

class ReservationInteractor {
    private let couchService: CouchServiceProtocol
    private let userService: UserServiceProtocol
    private let reservationService: ReservationServiceProtocol
    private let conversationService: ConversationServiceProtocol
    private let messageService: MessageServiceProtocol
    private let notificationManager: NotificationManagerProtocol
    
    init(couchService: CouchServiceProtocol, userService: UserServiceProtocol, reservationService: ReservationServiceProtocol,              conversationService: ConversationServiceProtocol, messageService: MessageServiceProtocol,
        notificationManager: NotificationManagerProtocol) {
        self.couchService = couchService
        self.userService = userService
        self.reservationService = reservationService
        self.conversationService = conversationService
        self.messageService = messageService
        self.notificationManager = notificationManager
    }
    
    func getOwner(ownerId: String, completion: @escaping (User?) -> Void) {
        userService.get(id: ownerId, completion: completion)
    }
    
    func getCouch(couchId: String, completion: @escaping (Couch?) -> Void) {
        couchService.get(id: couchId, completion: completion)
    }
    
    func addReservation(reservation: Reservation, completion: @escaping (Bool) -> Void) {
        reservationService.add(reservation: reservation, completion: { success in
            if !success {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            self.notificationManager.scheduleNotification(date: reservation.date.lowerBound)
            
            DispatchQueue.main.async {
                completion(true)
            }
        })
    }
}