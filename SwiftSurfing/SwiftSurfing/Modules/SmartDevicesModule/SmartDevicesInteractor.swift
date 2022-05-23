//
//  SmartDevicesInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation

class SmartDevicesInteractor {
    private let couchService: CouchServiceProtocol
    private let homeService: HomeServiceProtocol
    
    init(couchService: CouchServiceProtocol, homeService: HomeServiceProtocol) {
        self.couchService = couchService
        self.homeService = homeService
    }
    
    func getCouches(completion: @escaping ([Couch]) -> Void) {
        couchService.getAllCouches(completion: { couches in
            completion(couches)
        })
    }
    
    func getDevices(couchId: String, completion: @escaping ([HomeConfiguration]) -> Void) {
        homeService.getAllItems(couchId: couchId, completion: { devices in
            completion(devices)
        })
    }
    
    func switchItem(id: String, completion: @escaping (Bool) -> Void) {
        homeService.switchItem(id: id, completion: { success in
            completion(success)
        })
    }
}
