//
//  HomeService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation
import SwiftUI

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
    
    func getDeviceProperties(configurationId: String, completion: @escaping ([APIItem]) -> Void) {
        HomeAPI.getAllHomeDevicePropertiesForDeviceID(configurationId: configurationId, completion: { result, error in
            if error == nil {
                if let items = result {
                    completion(items)
                }
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
    
    func getDevice(configurationId: String, completion: @escaping (HomeConfiguration) -> Void) {
        HomeAPI.findHomeItemByID(configurationId: configurationId, completion: { result, error in
            if error == nil {
                if let homeConfiguration = result {
                    completion(homeConfiguration)
                }
            }
        })
    }
    
    func updatePropertyState(item: APIItem, completion: @escaping (Bool) -> Void) {
        HomeAPI.updateDevicePropertyState(body: item, completion: { _, error in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
}
