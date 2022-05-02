//
//  ReservationController.swift
//  
//
//  Created by Séllyei Bence on 2022. 05. 01..
//

import Foundation
import Vapor

struct ReservationController: RouteCollection {
    let reservationService: IReservationService
    let userService: IUserService
    let conversationsService: IConversationService
    let messageService: IMessageService
    let couchService: ICouchService
    
    init(reservationService: IReservationService, userService: IUserService, conversationsService: IConversationService, messageService: IMessageService, couchService: ICouchService) {
        self.reservationService = reservationService
        self.userService = userService
        self.conversationsService = conversationsService
        self.messageService = messageService
        self.couchService = couchService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let reservations = routes.grouped("reservations")
        reservations.post(use: createReservation)
        reservations.get("user", ":userId", use: getReservationsForUser)
        reservations.get(":couchId", use: getReservationsForCouch)
    }
    
    func createReservation(req: Request) async throws -> Reservation {
        let data = try req.content.decode(CreateReservationData.self)
        let reservation = Reservation(guestId: data.guestId, couchId: data.couchId, guestsNum: data.guestsNum, start: data.start, end: data.end)
        
        let couch = try await couchService.getCouch(id: data.couchId.uuidString)
        
        let _ = try await reservationService.createReservation(reservation: reservation)
        _ = try await createConversationAndMessage(ownerId: (couch?.$user.id.uuidString)!, guestId: data.guestId.uuidString)
        
        return reservation
    }
    
    func getReservationsForUser(req: Request) async throws -> [Reservation] {
        let foundUser = try await userService.getUser(id: req.parameters.get("userId"))
        guard let user = foundUser else { throw Abort(.notFound) }
        return try await reservationService.getReservations(user: user)
    }
    
    func getReservationsForCouch(req: Request) async throws -> [Reservation] {
        return try await reservationService.getReservations(couchId: req.parameters.get("couchId"))
    }
    
    private func createConversationAndMessage(ownerId: String, guestId: String) async throws -> Conversation {
        let foundUser1 = try await userService.getUser(id: ownerId)
        guard let ownerUser = foundUser1 else { throw Abort(.notFound) }
        var users = [ownerUser]
        
        let foundUser2 = try await userService.getUser(id: guestId)
        guard let guestUser = foundUser2 else { throw Abort(.notFound) }
        users.append(guestUser)
        
        let conversation = Conversation()
        let conversationResult = try await conversationsService.createConversation(conversation: conversation, users: users)
        
        let message = Message(userId: UUID(uuidString: guestId)!, conversationId: conversationResult.id!, text: "\(guestUser.fullName) has sent you a Reservation!", date: Date())
        _ = try await messageService.createMessage(message: message)
        
        return conversationResult
    }
}

struct CreateReservationData: Content {
    let guestId: UUID
    let couchId: UUID
    let guestsNum: Int
    let start: Date
    let end: Date
}
