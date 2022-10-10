//
//  IHomeConfigurationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation

//sourcery: AutoMockable
protocol IHomeConfigurationService {
    func getHomeConfigurations(couchId: String?) async throws -> [HomeConfiguration]
    
    func getHomeConfiguration(configurationId: String?) async throws -> HomeConfiguration?
    
    func createHomeConfigurations(configuration: HomeConfiguration) async throws -> HomeConfiguration
    
    func switchState(id: String?) async throws -> HomeConfiguration
    
    func getHomeConfigurationsByType(type: ConfigurationType, state: State) async throws -> [HomeConfiguration]
}
