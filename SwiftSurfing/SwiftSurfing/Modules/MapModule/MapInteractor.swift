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
import FirebaseAuth

class MapInteractor {
    private let service: CouchServiceProtocol
    
    init(couchService: CouchServiceProtocol) {
        self.service = couchService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        service.getAllCouchesByCity(city: "Budapest", completion: { couches in
            let user = Auth.auth().currentUser
            guard let userId = user?.uid else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            var filtered: [Couch] = []
            for couch in couches {
                if couch.userId != userId {
                    filtered.append(couch)
                }
            }
            
            DispatchQueue.main.async {
                completion(filtered)
            }
        })
    }
    
    func search(searchText: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(searchText) {
            completion($0?.first?.location?.coordinate, $1)
        }
    }
}
