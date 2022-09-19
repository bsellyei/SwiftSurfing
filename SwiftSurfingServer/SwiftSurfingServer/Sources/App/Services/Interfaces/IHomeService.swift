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
    
    func addHomeConfiguration(couchId: String?, name: String, type: String) async throws -> Bool
}
