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
import Alamofire

class CouchService: CouchServiceProtocol {
    var databaseRef: DatabaseReference?
    
    private let databaseUrl = "https://swiftsurfing-52ae5-default-rtdb.europe-west1.firebasedatabase.app"
    
    init() {
        self.databaseRef = Database.database(url: databaseUrl).reference(withPath: "Couch")
    }
    
    func addNew(couch: Couch, completion: @escaping (Bool) -> Void) {
        if couch.userId == "" {
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
        
            Geocoder.shared.geocodeAddressString(couch.address, service: .google, alternativeService: .apple) { (results, error) in
                if let address = results?.first, error == nil {
                    couch.latitude = address.coordinate?.latitude ?? 0
                    couch.longitude = address.coordinate?.longitude ?? 0
                    
                    let newCouch = CouchTransformator.transformToAPIModel(couch: couch)
                    CouchAPI.addCouch(body: newCouch, completion: { _, _ in
                        DispatchQueue.main.async {
                            completion(true)
                        }
                    })
                } else {
                    print("getting coordinates failed from addNewCouch")
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            }
        }
    }
    
    func get(id: String, completion: @escaping (Couch?) -> Void) {
        /*let couchRef = databaseRef?.child(id)
        couchRef?.observeSingleEvent(of: .value, with: { snapshot in
            let couch = Couch(snapshot: snapshot)
            DispatchQueue.main.async {
                completion(couch)
            }
        })*/
        
        CouchAPI.getCouchById(_id: id, completion: { couch, _ in
            DispatchQueue.main.async {
                completion(CouchTransformator.transformToClientModel(couch: couch!))
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
        
        CouchAPI.findAllCouchForUser(userId: userId, completion: { couches, _ in
            DispatchQueue.main.async {
                completion(CouchTransformator.transformToClientModel(couches: couches!))
            }
        })
        
        /*databaseRef?.queryOrdered(byChild: "userId").queryEqual(toValue: userId).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let couches = snapshot.reversed().compactMap(Couch.init)
            DispatchQueue.main.async {
                completion(couches)
            }
        })*/
    }
    
    // query all but for current user
    func getAllCouchesByCity(city: String, completion: @escaping ([Couch]) -> Void) {
        /*databaseRef?.queryOrdered(byChild: "city").queryEqual(toValue: city).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            let couches = snapshot.reversed().compactMap(Couch.init)
            DispatchQueue.main.async {
                completion(couches)
            }
        })*/
        
        let user = Auth.auth().currentUser
        guard let userId = user?.uid else {
            DispatchQueue.main.async {
                completion([])
            }
            return
        }
        
        CouchAPI.findAllCouchByCityExceptUserId(cityName: city, userId: userId, completion: { couches, _ in
            DispatchQueue.main.async {
                completion(CouchTransformator.transformToClientModel(couches: couches!))
            }
        })
    }
    
    func update(couch: Couch, completion: @escaping (Bool) -> Void) {
        /*let couchRef = self.databaseRef?.child(couch.id)
        couchRef?.setValue(couch.toAnyObject())
        DispatchQueue.main.async {
            completion(true)
        }*/
    }
    
    func delete(couch: Couch) {
        
    }
    
    class CouchTransformator {
        static func transformToClientModel(couch: GeneratedCouch) -> Couch {
            let result = Couch()
            result.id = couch._id!
            result.userId = couch.user?._id! ?? ""
            result.name = couch.name!
            result.address = couch.address!
            result.city = couch.city!
            result.country = couch.country!
            result.latitude = couch.latitude!
            result.longitude = couch.longitude!
            result.maxGuests = couch.maxGuests!
            result.description = couch._description!
            result.imageURLs = couch.imageUrls!
            result.ratingAverage = couch.ratingAverage!
            result.ratingCount = couch.ratingCount!
            return result
        }
        
        static func transformToAPIModel(couch: Couch) -> GeneratedCouch {
            let result = GeneratedCouch(_id: couch.id, name: couch.name, address: couch.address, city: couch.city, country: couch.country, latitude: couch.latitude, longitude: couch.longitude, maxGuests: couch.maxGuests, _description: couch.description, imageUrls: couch.imageURLs, ratingAverage: couch.ratingAverage, ratingCount: couch.ratingCount, user: GeneratedUser(_id: couch.userId, fullName: "", email: ""))
            
            return result
        }
        
        static func transformToClientModel(couches: [GeneratedCouch]) -> [Couch] {
            var result: [Couch] = []
            for couch in couches {
                result.append(CouchTransformator.transformToClientModel(couch: couch))
            }
            
            return result
        }
    }
}
