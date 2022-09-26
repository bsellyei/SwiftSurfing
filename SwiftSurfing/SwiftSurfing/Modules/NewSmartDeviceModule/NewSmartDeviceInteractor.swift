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
        
        //return ["Heater", "Air Conditioner", "Smart Plug"]
    }
    
    func getCouchAddressesToIds() -> [String:String] {
        var addressesToIds: [String:String] = [:]
        couchService.getAllCouches(completion: { couches in
            for couch in couches {
                addressesToIds[couch.address] = couch.id.stringValue
            }
        })
        
        return addressesToIds
    }
    
    func getDeviceTypeProperties(completion: @escaping ([Channel]) -> Void) {
        homeService.getDeviceTypeProperties(completion: { channels in
            completion(channels)
        })
        
        /*return [
            Channel(id: "power", type: "Switch", label: "Power"),
            Channel(id: "usb", type: "Switch", label: "USB"),
            Channel(id: "temperature", type: "Number:Temperature", label: "Temperature")
        ]*/
    }
    
    func addNewDevice(device: Device, completion: @escaping (Bool) -> Void) {
        homeService.addNewDevice(device: device, completion: { success in
            completion(success)
        })
    }
}

struct Device {
    var couchId: String
    var name: String
    var type: String
    
    var items: [Channel]
}
