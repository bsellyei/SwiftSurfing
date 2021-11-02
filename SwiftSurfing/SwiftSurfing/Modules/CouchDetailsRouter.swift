//
//  CouchDetailsRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation
import SwiftUI

class CouchDetailsRouter {
    func makeReservationView(reservation: Reservation) -> some View {
        let interactor = ReservationInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!,
                                               userService: DIContainer.instance.resolve(type: UserServiceProtocol.self)!,
                                               reservationService: DIContainer.instance.resolve(type: ReservationServiceProtocol.self)!,
                                               conversationService: DIContainer.instance.resolve(type: ConversationServiceProtocol.self)!,
                                               messageService: DIContainer.instance.resolve(type: MessageServiceProtocol.self)!,
                                               notificationManager: DIContainer.instance.resolve(type: NotificationManagerProtocol.self)!)
        let presenter = ReservationPresenter(interactor: interactor, reservation: reservation)
        return ReservationView(presenter: presenter)
    }
    
    func makeRatingsView(couchId: String) -> some View {
        let interactor = RatingsInteractor(ratingsService: DIContainer.instance.resolve(type: RatingServiceProtocol.self)!,
                                           couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!)
        let presenter = RatingsPresenter(interactor: interactor, couchId: couchId)
        return RatingsView(presenter: presenter)
    }
}
