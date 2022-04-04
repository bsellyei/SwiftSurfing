//
//  HomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation
import Vapor

class HomeService: IHomeService {
    let homeConfigurationService: IHomeConfigurationService
    
    init(homeConfigurationService: IHomeConfigurationService) {
        self.homeConfigurationService = homeConfigurationService
    }
    
    func getHomeConfigurations(couchId: String?) async throws -> [HomeConfiguration] {
        return try await homeConfigurationService.getHomeConfigurations(couchId: couchId)
    }
    
    func switchItem(configurationId: String?) async throws -> HomeConfiguration {
        return try await homeConfigurationService.switchState(id: configurationId)
    }
}
