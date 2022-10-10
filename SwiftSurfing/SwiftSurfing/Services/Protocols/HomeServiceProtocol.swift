//
//  HomeServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation

protocol HomeServiceProtocol {
    func getAllItems(couchId: String, completion: @escaping ([HomeConfiguration]) -> Void)
    
    func switchItem(id: String, completion: @escaping (Bool) -> Void)
    
    func getDeviceTypes(completion: @escaping ([String]) -> Void)
    
    func getDeviceTypeProperties(completion: @escaping ([Channel]) -> Void)
    
    func getDeviceProperties(configurationId: String, completion: @escaping ([APIItem]) -> Void)
    
    func addNewDevice(body: CreateHomeConfigurationData, completion: @escaping (Bool) -> Void)
    
    func getDevice(configurationId: String, completion: @escaping (HomeConfiguration) -> Void)
    
    func updatePropertyState(item: APIItem, completion: @escaping (Bool) -> Void)
}
