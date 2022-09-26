//
//  IHomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation

protocol IHomeService {
    func getHomeConfigurations(couchId: String?) async throws -> [HomeConfiguration]
    
    func switchItem(configurationId: String?) async throws -> HomeConfiguration
    
    func addHomeConfiguration(configuration: HomeConfiguration) async throws -> Bool
    
    func getConfigurationTypes() async throws -> [ConfigurationType]
    
    func getConfigurationTypeProperties() async throws -> [Channel]
    
    func saveItems(configurationName: String, items: [Item]) async throws -> Bool
}
