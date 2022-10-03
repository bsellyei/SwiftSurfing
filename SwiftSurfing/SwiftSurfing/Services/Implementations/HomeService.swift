//
//  HomeService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation

class HomeService: HomeServiceProtocol {
    func getAllItems(couchId: String, completion: @escaping ([HomeConfiguration]) -> Void) {
        HomeAPI.findAllHomeItemsForUser(couchId: couchId, completion: { result, error in
            if error == nil && result != nil {
                completion(result!)
            }
        })
    }
    
    func switchItem(id: String, completion: @escaping (Bool) -> Void) {
        HomeAPI.switchItem(itemId: id, completion: { _, error in
            if error == nil {
                completion(true)
            }
        })
    }
    
    func getDeviceTypes(completion: @escaping ([String]) -> Void) {
        HomeAPI.getAllHomeDeviceTypes(completion: { types, error in
            if error == nil {
                if let deviceTypes = types {
                    var result: [String] = []
                    for deviceType in deviceTypes {
                        result.append(deviceType.rawValue)
                    }
                    
                    completion(result)
                }
            } else {
                completion([])
            }
        })
    }
    
    func getDeviceTypeProperties(completion: @escaping ([Channel]) -> Void) {
        HomeAPI.getAllHomeDeviceProperties(completion: { channels, error in
            if error == nil {
                if let result = channels {
                    completion(result)
                }
            } else {
                completion([])
            }
        })
    }
    
    func addNewDevice(body: CreateHomeConfigurationData, completion: @escaping (Bool) -> Void) {
        HomeAPI.createHomeConfiguration(body: body, completion: { result, error in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
}
