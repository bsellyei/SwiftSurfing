//
//  MapView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var presenter: MapPresenter
    
    init(presenter: MapPresenter) {
        self.presenter = presenter
    }
        
    var body: some View {
        Map(coordinateRegion: $presenter.region,
            annotationItems: presenter.annotations) { annotation in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MapInteractor()
        let presenter = MapPresenter(interactor: interactor)
        return MapView(presenter: presenter)
    }
}
