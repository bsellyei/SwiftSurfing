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
    
    func addHomeConfiguration(couchId: String?, name: String, type: String) async throws -> Bool {
        _ = try await homeConfigurationService.createHomeConfigurations(configuration: HomeConfiguration(couchId: couch.id!, type: ConfigurationType.init(rawValue: type)!, state: .off))
        let things = await externalHomeService.getAllThings()
        if !things.isEmpty {
            let thing = things.first!
            if !thing.channels?.isEmpty {
                let channels = thing.channels!
                for channel in channels {
                    if channel.itemType! == "Switch" || channel.itemType! == "Number:Temperature" {
                        let item = try await externalHomeService.addItem(name: name + "_" + channel.id,
                                                               label: channel.label!,
                                                               type: channel.itemType!)
                        
                        let success = try await externalHomeService.linkItemToChannel(itemName: item.name, channelId: channel.uid!)
                        if !success {
                            return success
                        }
                    }
                }
            }
        }
        
        return success
    }
}
