//
// CreateReservationData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct CreateReservationData: Codable {

    public var guestId: String?
    public var couchId: String?
    public var guestsNum: Int?
    public var start: String?
    public var end: String?

    public init(guestId: String?, couchId: String?, guestsNum: Int?, start: String?, end: String?) {
        self.guestId = guestId
        self.couchId = couchId
        self.guestsNum = guestsNum
        self.start = start
        self.end = end
    }


}

