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
    
    func getHomeConfiguration(configurationId: String?) async throws -> HomeConfiguration? {
        return try await homeConfigurationService.getHomeConfiguration(configurationId: configurationId)
    }
    
    func switchItem(configurationId: String?) async throws -> HomeConfiguration {
        return try await homeConfigurationService.switchState(id: configurationId)
    }
    
    func getConfigurationTypes() async throws -> [ConfigurationType] {
        return ConfigurationType.allCases
    }
    
    func getConfigurationTypeProperties(configType: ConfigurationType) async throws -> [HomeChannel] {
        if configType == .lock {
            var channel = HomeChannel()
            channel.uid = "lock"
            channel.id = "Lock"
            channel.label = "Lock"
            channel.itemType = "Switch"
            return [channel]
        } else {
            let things = try await externalHomeService.getAllThings()
            if !things.isEmpty {
                let thing = things.first!
                if let channels = thing.channels {
                    if !channels.isEmpty {
                        return channels
                    }
                }
            }
        }
        
        return []
    }
    
    func addHomeConfiguration(configuration: HomeConfiguration) async throws -> Bool {
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: configuration)
        
        return try await linkItemsToChannel(configurationName: configuration.name, configType: configuration.type)
    }
    
    private func linkItemsToChannel(configurationName: String, configType: ConfigurationType) async throws -> Bool {
        let channels = try await getConfigurationTypeProperties(configType: configType)
        for channel in channels {
            if channel.itemType! == "Switch" || channel.itemType! == "Number:Temperature" {
                let item = try await externalHomeService.addItem(name: configurationName + "_" + channel.id!,
                                                                 label: channel.label!,
                                                                 type: channel.itemType!)
                
                if configType != .lock {
                    let success = try await externalHomeService.linkItemToChannel(itemName: item.name!, channelId: channel.uid!)
                    if !success {
                        return success
                    }
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
    
    func getItemsByHomeConfiguration(configurationId: String?) async throws -> [Item] {
        let homeConfiguration = try await getHomeConfiguration(configurationId: configurationId)
        var items: [Item] = []
        if let configuration = homeConfiguration {
            for name in configuration.itemNames {
                let item = try await externalHomeService.getItem(name: name)
                items.append(item)
            }
        }
        
        return items
    }
    
    func setItemState(item: Item) async throws -> Bool {
        if let itemName = item.name, let itemState = item.state {
            return try await externalHomeService.setItemState(name: itemName, newState: itemState.uppercased())
        }
        
        return false
    }
}
