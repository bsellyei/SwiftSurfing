//
//  HomeConfigurationService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation
import Fluent
import Vapor

class HomeConfigurationService: IHomeConfigurationService {
    var db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func getHomeConfigurations(couchId: String?) async throws -> [HomeConfiguration] {
        let uuid = UUID(uuidString: couchId!)
        return try await HomeConfiguration.query(on: db)
            .filter(\.$couch.$id == uuid!)
            .all()
    }
    
    func getHomeConfiguration(configurationId: String?) async throws -> HomeConfiguration? {
        let uuid = UUID(uuidString: configurationId!)
        let found = try await HomeConfiguration.find(uuid, on: db)
        guard let homeConfiguration = found else { return nil }
        
        return homeConfiguration
            
    }
    
    func createHomeConfigurations(configuration: HomeConfiguration) async throws -> HomeConfiguration {
        try await configuration.save(on: db)
        return configuration
    }
    
    func switchState(id: String?) async throws -> HomeConfiguration {
        let uuid = UUID(uuidString: id!)
        let found = try await HomeConfiguration.find(uuid, on: db)
        guard let configuration = found else { throw Abort(.notFound) }
        
        let newState: State
        switch configuration.state {
            case .on:
                newState = .off
            case .off:
                newState = .on
        }
       
        configuration.state = newState
        try await configuration.save(on: db)
        return configuration
    }
    
    func getHomeConfigurationsByType(type: ConfigurationType, state: State) async throws -> [HomeConfiguration] {
        return try await HomeConfiguration.query(on: db)
            .filter(\.$type == type)
            .filter(\.$state == state)
            .all()
    }
}
