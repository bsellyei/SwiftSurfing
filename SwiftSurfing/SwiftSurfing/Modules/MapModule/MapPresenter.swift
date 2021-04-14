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
    
    @Published var annotations: [MyAnnotation] = []
    
    @Published var searchText: String
    
    init(interactor: MapInteractor) {
        self.interactor = interactor
        searchText = ""
    }
    
    func getCouches() {
        /*DispatchQueue.global(qos: .background).async {
            self.interactor.getCouches(completion: { couches in
                self.annotations = couches
            })
        }*/
    }
    
    func search() -> Void {
        print(searchText)
    }
}
