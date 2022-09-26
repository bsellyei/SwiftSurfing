//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

import Foundation
import Vapor
import Fluent

struct HomeController: RouteCollection {
    let homeService: IHomeService
    
    init(homeService: IHomeService) {
        self.homeService = homeService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let home = routes.grouped("home")
        home.get("items", ":couchId", use: getAllItems)
        home.post("switch", ":itemId", use: switchItem)
        
        home.get("types", use: getConfigurationTypes)
        home.get("properties", use: getConfigurationTypeProperties)
        
        home.post("items", use: createHomeConfiguration)
    }
    
    func getAllItems(req: Request) async throws -> [HomeConfiguration] {
        return try await homeService.getHomeConfigurations(couchId: req.parameters.get("couchId"))
    }
    
    func switchItem(req: Request) async throws -> HomeConfiguration {
        return try await homeService.switchItem(configurationId: req.parameters.get("itemId"))
    }
    
    func getConfigurationTypes(req: Request) async throws -> [ConfigurationType] {
        return try await homeService.getConfigurationTypes()
    }
    
    func getConfigurationTypeProperties(req: Request) async throws -> [Channel] {
        return try await homeService.getConfigurationTypeProperties()
    }
    
    func createHomeConfiguration(req: Request) async throws -> HomeConfiguration {
        let data = try req.content.decode(CreateConfigurationData.self)
        var itemNames: [String] = []
        for item in data.items {
            if let itemName = item.name {
                itemNames.append(data.name + "_" + itemName)
            }
        }
        
        var itemState: State = .off
        if let first = data.items.first {
            if let state = first.state {
                itemState = State.init(rawValue: state)!
            }
        }
        
        let homeConfiguration = HomeConfiguration(couchId: data.couchId,
                                                  name: data.name,
                                                  type: ConfigurationType.init(rawValue: data.type)!,
                                                  itemNames: itemNames,
                                                  state: itemState)
        var success = try await homeService.addHomeConfiguration(configuration: homeConfiguration)
        if !success { throw Abort(.internalServerError) }
        
        success = try await homeService.saveItems(configurationName: data.name, items: data.items)
        
        return homeConfiguration
    }
}

struct CreateConfigurationData: Content {
    let couchId: UUID
    let name: String
    let type: String
    
    let items: [Item]
}
