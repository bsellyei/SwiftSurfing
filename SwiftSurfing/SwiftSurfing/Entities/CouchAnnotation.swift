//
//  CouchAnnotation.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 21..
//

import Foundation
import MapKit

class CouchAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        
        super.init()
    }
}
