//
//  MapPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import Foundation
import MapKit

class MapPresenter: ObservableObject {
    private let interactor: MapInteractor
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.497913, longitude: 19.040236),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @Published var annotations: [Couch] = [
        //Couch(name: "Parliament", latitude: 47.506851, longitude: 19.045776),
        //Couch(name: "Matthias Church", latitude: 47.501164662 , longitude: 19.033833198)
    ]
    
    init(interactor: MapInteractor) {
        self.interactor = interactor
    }
}
