//
//  Reservation.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import Foundation
import Firebase

class Reservation: Identifiable {
    let ref: DatabaseReference?
    let id: String
    var ownerId: String
    var guestId: String
    var couchId: String
    var guestsNum: Int
    var date: ClosedRange<Date>
    var isPending: Bool
 
    init() {
        self.ref = nil
        self.id = UUID().uuidString
        self.ownerId = ""
        self.guestId = ""
        self.couchId = ""
        self.guestsNum = 0
        self.date = ClosedRange<Date>(uncheckedBounds: (lower: Date(), upper: Date()))
        self.isPending = true
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let id = value["id"] as? String,
            let ownerId = value["ownerId"] as? String,
            let guestId = value["guestId"] as? String,
            let couchId = value["couchId"] as? String,
            let guestsNum = value["guestsNum"] as? Int,
            let date = value["date"] as? String,
            let pending = value["isPending"] as? Bool
        else {
            return nil
        }
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy"
        let components = date.components(separatedBy: " - ")
        let lowerDate = dateformatter.date(from: components[0])
        let upperDate = dateformatter.date(from: components[1])
        
        guard let lowDate = lowerDate,
              let upDate = upperDate
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.ownerId = ownerId
        self.guestId = guestId
        self.couchId = couchId
        self.guestsNum = guestsNum
        self.date = ClosedRange<Date>(uncheckedBounds: (lower: lowDate, upper: upDate))
        self.isPending = pending
    }
    
    func toAnyObject() -> Any {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy"
        let lowerText = dateformatter.string(from: date.lowerBound)
        let upperText = dateformatter.string(from: date.upperBound)
        
        return [
            "id": id,
            "ownerId": ownerId,
            "guestId": guestId,
            "couchId": couchId,
            "guestsNum": guestsNum,
            "date": lowerText + " - " + upperText,
            "isPending": isPending
        ]
    }
}
