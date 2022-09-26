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
    let externalHomeService: IExternalHomeService
    
    init(homeConfigurationService: IHomeConfigurationService, externalHomeService: IExternalHomeService) {
        self.homeConfigurationService = homeConfigurationService
        self.externalHomeService = externalHomeService
    }
    
    func getHomeConfigurations(couchId: String?) async throws -> [HomeConfiguration] {
        return try await homeConfigurationService.getHomeConfigurations(couchId: couchId)
    }
    
    func switchItem(configurationId: String?) async throws -> HomeConfiguration {
        return try await homeConfigurationService.switchState(id: configurationId)
    }
    
    func getConfigurationTypes() async throws -> [ConfigurationType] {
        return ConfigurationType.allCases
    }
    
    func getConfigurationTypeProperties() async throws -> [Channel] {
        let things = try await externalHomeService.getAllThings()
        if !things.isEmpty {
            let thing = things.first!
            if let channels = thing.channels {
                if !channels.isEmpty {
                    return channels
                }
            }
        }
        
        return []
    }
    
    func addHomeConfiguration(configuration: HomeConfiguration) async throws -> Bool {
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: configuration)
        
        return try await linkItemsToChannel(configurationName: configuration.name)
    }
    
    private func linkItemsToChannel(configurationName: String) async throws -> Bool {
        let channels = try await getConfigurationTypeProperties()
        for channel in channels {
            if channel.itemType! == "Switch" || channel.itemType! == "Number:Temperature" {
                let item = try await externalHomeService.addItem(name: configurationName + "_" + channel.id!,
                                                                 label: channel.label!,
                                                                 type: channel.itemType!)
                        
                let success = try await externalHomeService.linkItemToChannel(itemName: item.name!, channelId: channel.uid!)
                if !success {
                    return success
                }
            }
        }
        
        return true
    }
    
    func saveItems(configurationName: String, items: [Item]) async throws -> Bool {
        var success = false
        for item in items {
            if let itemName = item.name {
                let fullItemName = configurationName + "_" + itemName
                if let itemState = item.state {
                    success = try await self.externalHomeService.setItemState(name: fullItemName, newState: itemState)
                }
            }
            
            if !success { return success }
        }
        
        return success
    }
}
