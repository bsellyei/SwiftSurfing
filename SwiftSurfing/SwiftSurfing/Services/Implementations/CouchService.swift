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
import FirebaseAuth

class CouchService: CouchServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Couch")
    }
    
    func addNew(couch: Couch, completion: @escaping (Bool) -> Void) {
        if couch.userId.isEmpty {
            let user = Auth.auth().currentUser
            guard
                let userId = user?.uid
            else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            couch.userId = userId
        }
        
        Geocoder.shared.geocodeAddressString(couch.address, service: .google, alternativeService: .apple) { (results, error) in
            if let address = results?.first, error == nil {
                couch.latitude = address.coordinate?.latitude ?? 0
                couch.longitude = address.coordinate?.longitude ?? 0
                let couchRef = self.databaseRef?.child(couch.id)
                couchRef?.setValue(couch.toAnyObject())
                
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                print("getting coordinates failed from addNewCouch")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
    
    func get(id: String, completion: @escaping (Couch?) -> Void) {
        let couchRef = databaseRef?.child(id)
        couchRef?.observeSingleEvent(of: .value, with: { snapshot in
            let couch = Couch(snapshot: snapshot)
            DispatchQueue.main.async {
                completion(couch)
            }
        })
    }
    
    // for current user
    func getAllCouches(completion: @escaping ([Couch]) -> Void) {
        let user = Auth.auth().currentUser
        guard let userId = user?.uid else {
            DispatchQueue.main.async {
                completion([])
            }
            return
        }
        
        databaseRef?.queryOrdered(byChild: "userId").queryEqual(toValue: userId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let couches = snapshot.reversed().compactMap(Couch.init)
            DispatchQueue.main.async {
                completion(couches)
            }
        })
    }
    
    // query all but for current user
    func getAllCouchesByCity(city: String, completion: @escaping ([Couch]) -> Void) {
        databaseRef?.queryOrdered(byChild: "city").queryEqual(toValue: city).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let couches = snapshot.reversed().compactMap(Couch.init)
            DispatchQueue.main.async {
                completion(couches)
            }
        })
    }
    
    func update(couch: Couch, completion: @escaping (Bool) -> Void) {
        let couchRef = self.databaseRef?.child(couch.id)
        couchRef?.setValue(couch.toAnyObject())
        DispatchQueue.main.async {
            completion(true)
        }
    }
    
    func delete(couch: Couch) {
        
    }
}
