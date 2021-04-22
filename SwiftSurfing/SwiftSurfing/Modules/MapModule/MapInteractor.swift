//
//  MapInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import Foundation
import LMGeocoderSwift
import CoreData
import CoreLocation

class MapInteractor {
    private let service: CouchServiceProtocol
    
    init(couchService: CouchServiceProtocol) {
        self.service = couchService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        service.getAllCouches(completion: completion)
    }
    
    func search(searchText: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(searchText) {
            completion($0?.first?.location?.coordinate, $1)
        }
    }
}
