//
//  NewCouchInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import Firebase
import CoreData

class NewCouchInteractor {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Couch")
    }
    
    func addNewCouch(couch: Couch) {
        let coordinate = getCoordinate(address: couch.address)
        if CLLocationCoordinate2DIsValid(coordinate) {
            couch.latitude = coordinate.latitude
            couch.longitude = coordinate.longitude
        }
        let couchRef = self.databaseRef?.child(couch.id)
        couchRef?.setValue(couch.toAnyObject())
    }
    
    private func getCoordinate(address: String) -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        var coordinate = kCLLocationCoordinate2DInvalid
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    coordinate = placemark.location!.coordinate
                    return
                }
            }
        }
        return coordinate
    }
}
