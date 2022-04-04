//
//  MapViewKit.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 14..
//

import SwiftUI
import MapKit

struct MapViewKit: UIViewRepresentable {
    private var annotations: [CouchAnnotation]
    private var region: MKCoordinateRegion
    
    init(region: MKCoordinateRegion, annotations: [CouchAnnotation]) {
        self.region = region
        self.annotations = annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if region.center.latitude != view.region.center.latitude && region.center.longitude != view.region.center.longitude {
            view.setRegion(region, animated: true)
        }
        
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewKit
        
        init(_ parent: MapViewKit) {
            self.parent = parent
        }
    }
}