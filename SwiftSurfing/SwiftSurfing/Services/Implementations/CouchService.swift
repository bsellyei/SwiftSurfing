//
//  CouchService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 24..
//

import Foundation
import Firebase
import CoreData
import LMGeocoderSwift

class CouchService: CouchServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Couch")
    }
    
    func addNew(couch: Couch, completion: @escaping (Bool) -> Void) {
        Geocoder.shared.geocodeAddressString(couch.address, service: .google) { (results, error) in
            if let address = results?.first, error == nil {
                couch.latitude = address.coordinate?.latitude ?? 0
                couch.longitude = address.coordinate?.longitude ?? 0
                let couchRef = self.databaseRef?.child(couch.id)
                couchRef?.setValue(couch.toAnyObject())
                
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
    
    func get(couch: Couch) {
        
    }
    
    func getAllCouches(completion: @escaping ([Couch]) -> Void) {
        databaseRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let couches = snapshot.reversed().compactMap(Couch.init)
            DispatchQueue.main.async {
                completion(couches)
            }
        })
    }
    
    func update(couch: Couch) {
        
    }
    
    func delete(couch: Couch) {
        
    }
}
