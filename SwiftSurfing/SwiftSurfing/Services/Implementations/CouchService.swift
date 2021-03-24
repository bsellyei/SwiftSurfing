//
//  CouchService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 24..
//

import Foundation
import Firebase
import CoreData

class CouchService: CouchServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Couch")
    }
    
    func addNew(couch: Couch) {
        let coordinate = getCoordinateFrom(address: couch.address)
        if CLLocationCoordinate2DIsValid(coordinate) {
            couch.latitude = coordinate.latitude
            couch.longitude = coordinate.longitude
        }
        let couchRef = self.databaseRef?.child(couch.id)
        couchRef?.setValue(couch.toAnyObject())
    }
    
    func get(couch: Couch) {
        
    }
    
    func getAllCouches() {
        
    }
    
    func update(couch: Couch) {
        
    }
    
    func delete(couch: Couch) {
        
    }
    
    private func getCoordinateFrom(address: String) -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        var coordinate = kCLLocationCoordinate2DInvalid
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    if let location = placemark.location {
                        coordinate = location.coordinate
                        return
                    }
                }
            }
        }
        return coordinate
    }
}
