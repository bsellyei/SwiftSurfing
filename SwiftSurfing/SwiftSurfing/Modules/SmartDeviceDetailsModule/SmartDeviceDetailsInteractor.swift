//
//  SmartDeviceDetailsInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 10. 07..
//

import Foundation

class SmartDeviceDetailsInteractor {
    private let homeService: HomeServiceProtocol
    private let couchService: CouchServiceProtocol
    
    init(homeService: HomeServiceProtocol, couchService: CouchServiceProtocol) {
        self.homeService = homeService
        self.couchService = couchService
    }
    
    func getCouchAddress(couchId: String, completion: @escaping (String) -> Void) {
        couchService.get(id: couchId, completion: { couch in
            DispatchQueue.main.async {
                if let found = couch {
                    completion(found.address)
                }
            }
        })
    }
    
    func getSmartDevice(id: String, completion: @escaping (HomeConfiguration) -> Void) {
        homeService.getDevice(configurationId: id, completion: { result in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
    
    func getItems(id: String, completion: @escaping ([APIItem]) -> Void) {
        homeService.getDeviceProperties(configurationId: id, completion: { result in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
    
    func updatePropertyState(item: APIItem, completion: @escaping (Bool) -> Void) {
        homeService.updatePropertyState(item: item, completion: { result in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
}
