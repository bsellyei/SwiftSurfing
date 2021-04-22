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
    
    @Published var annotations: [CouchAnnotation] = []
    @Published var couches: [Couch] = []
    
    init(interactor: MapInteractor) {
        self.interactor = interactor
        
        getCouches()
    }
    
    func getCouches() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getCouches(completion: { couches in
                self.couches = couches
                self.annotations = self.makeCouchAnnotations(couches: couches)
            })
        }
    }
    
    func search(searchText: String) -> Void {
        DispatchQueue.global(qos: .background).async {
            self.interactor.search(searchText: searchText, completion: { coordinate, error in
                guard let coordinate = coordinate, error == nil else { return }
                DispatchQueue.main.async {
                    self.region.center = coordinate
                }
            })
        }
        //getCouches()
    }
    
    private func makeCouchAnnotations(couches: [Couch]) -> [CouchAnnotation] {
        var couchAnnotations: [CouchAnnotation] = []
        for couch in couches {
            let couchAnnotation = CouchAnnotation(coordinate: CLLocationCoordinate2D(
                                                  latitude: couch.latitude, longitude: couch.longitude))
            couchAnnotations.append(couchAnnotation)
        }
        return couchAnnotations
    }
}
