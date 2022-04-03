//
//  HomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation

class HomeService: IHomeService {
    let accessToken = "oh.token1.OeBR0gE05A01XKRIz7DnYVl5BMMMRQLLGMk0nvA7D1QQXp0TkH3gjpcHkd5lorQAdeyWT3xpzyiUsds3bGKA"
    let baseURL = "http://localhost:8080/rest/"
    
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
