//
//  CouchDetailsPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import Foundation
import UIKit
import MapKit

class CouchDetailsPresenter: ObservableObject {
    private let interactor: CouchDetailsInteractor
    
    @Published var couch: Couch
    @Published var images: [UIImage]
    @Published var region: MKCoordinateRegion
    
    var disableReserve: Bool {
        true
    }
    
    init(interactor: CouchDetailsInteractor, couch: Couch) {
        self.interactor = interactor
        self.couch = couch
        self.images = []
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: couch.latitude, longitude: couch.longitude),
                                         span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
        
    }
}
