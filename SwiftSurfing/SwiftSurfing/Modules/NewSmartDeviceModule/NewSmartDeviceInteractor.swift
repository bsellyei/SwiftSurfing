//
//  NewSmartDeviceInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 09. 23..
//

import Foundation

class NewSmartDeviceInteractor {
    private let couchService: CouchServiceProtocol
    private let homeService: HomeServiceProtocol
    
    init(couchService: CouchServiceProtocol, homeService: HomeServiceProtocol) {
        self.couchService = couchService
        self.homeService = homeService
    }
    
    func getDeviceTypes(completion: @escaping ([String]) -> Void) {
        homeService.getDeviceTypes(completion: { deviceTypes in
            completion(deviceTypes)
        })
    }
    
    func getCouchAddressesToIds(completion: @escaping ([String:String]) -> Void) {
        couchService.getAllCouches(completion: { couches in
            var addressesToIds: [String:String] = [:]
            for couch in couches {
                addressesToIds[couch.address] = couch.id.stringValue
            }
            
            completion(addressesToIds)
        })
    }
    
    func getDeviceTypeProperties(completion: @escaping ([Channel]) -> Void) {
        homeService.getDeviceTypeProperties(completion: { channels in
            completion(channels)
        })
    }
    
    func addNewDevice(createHomeConfigData: CreateHomeConfigurationData, completion: @escaping (Bool) -> Void) {
        homeService.addNewDevice(body: createHomeConfigData, completion: { success in
            completion(success)
        })
    }
}
