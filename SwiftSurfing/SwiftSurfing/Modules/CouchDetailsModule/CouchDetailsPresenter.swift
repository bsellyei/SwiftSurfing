//
//  CouchDetailsPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation
import UIKit
import MapKit
import SwiftUI
import FirebaseAuth

class CouchDetailsPresenter: ObservableObject {
    private let interactor: CouchDetailsInteractor
    private let router = CouchDetailsRouter()
    
    @Published var couch: Couch
    
    @Published var region: MKCoordinateRegion
    
    @Published var selectedDates: ClosedRange<Date>?
    @Published var showOverlay: Bool
    
    private var reservation: Reservation
    
    var selectedDatesText: String {
        if let range = selectedDates {
            self.reservation.date = range
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd"
            let dayOfLowerDate = dateformatter.string(from: range.lowerBound)
            let dayOfUpperDate = dateformatter.string(from: range.upperBound)
            let monthOfLowerDate = Calendar.current.dateComponents([.month], from: range.lowerBound)
            let monthOfUpperDate = Calendar.current.dateComponents([.month], from: range.upperBound)
            return "\(dateformatter.shortMonthSymbols[monthOfLowerDate.month ?? 0]) \(dayOfLowerDate)" + " - " + "\(dateformatter.shortMonthSymbols[monthOfUpperDate.month ?? 0]) \(dayOfUpperDate)"
        } else {
            return "No dates selected"
        }
    }
    
    var disableReserve: Bool {
        selectedDates == nil
    }
    
    init(interactor: CouchDetailsInteractor, couch: Couch) {
        self.interactor = interactor
        self.couch = couch
        
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: couch.latitude, longitude: couch.longitude),
                                         span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
        self.selectedDates = nil
        self.showOverlay = false
        
        self.reservation = Reservation()
        reservation.couchId = couch.id
        reservation.ownerId = couch.userId
        reservation.guestsNum = couch.maxGuests
    }
    
    func linkBuilder<Content: View>(@ViewBuilder content: () -> Content, isActive: Binding<Bool>)
        -> some View
    {
        NavigationLink(destination: router.makeReservationView(reservation: self.reservation), isActive: isActive) {
            content()
        }
    }
}
