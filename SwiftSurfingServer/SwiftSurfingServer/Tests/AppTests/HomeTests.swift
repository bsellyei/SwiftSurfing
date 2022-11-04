//
//  HomeTests.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

@testable import App
import XCTVapor
import Foundation
import SwiftyMocky

let externalHomeService = IExternalHomeServiceMock()

final class HomeTests: XCTestCase {
    let homeURI = "/home/"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
        let homeConfigurationService = HomeConfigurationService(db: app.db)
        let homeService = HomeService(homeConfigurationService: homeConfigurationService, externalHomeService: externalHomeService)
        
        try app.register(collection: HomeController(homeService: homeService))
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testGetHomeConfigurations() throws {
        let couch = try Couch.create(on: app.db)
        let _ = try HomeConfiguration.create(couch: couch, type: .heating, state: .off, on: app.db)
        
        try app.test(.GET, "\(homeURI)items/\(couch.id!)", afterResponse: { response in
            let configurations = try response.content.decode([HomeConfiguration].self)
            
            XCTAssertEqual(configurations.count, 1)
            XCTAssertEqual(configurations[0].type, .heating)
            XCTAssertEqual(configurations[0].state, .off)
        })
    }
    
    func testGetHomeConfiguration() throws {
        let couch = try Couch.create(on: app.db)
        let configuration1 = try HomeConfiguration.create(couch: couch, type: .heating, state: .off, on: app.db)
        
        try app.test(.GET, "\(homeURI)item/\(configuration1.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, configuration1.id)
            XCTAssertEqual(configuration.name, configuration1.name)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .off)
        })
    }
    
    func testSwitchHomeConfigurationItem() throws {
        let couch = try Couch.create(on: app.db)
        let configuration1 = try HomeConfiguration.create(couch: couch, type: .heating, state: .off, on: app.db)
        
        try app.test(.GET, "\(homeURI)item/\(configuration1.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, configuration1.id)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .off)
        })
        
        try app.test(.POST, "\(homeURI)switch/\(configuration1.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, configuration1.id)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .on)
        })
        
        try app.test(.GET, "\(homeURI)item/\(configuration1.id!)", afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.id, configuration1.id)
            XCTAssertEqual(configuration.type, .heating)
            XCTAssertEqual(configuration.state, .on)
        })
    }
    
    func testGetConfigurationTypes() throws {
        try app.test(.GET, "\(homeURI)types/", afterResponse: {response in
            let types = try response.content.decode([ConfigurationType].self)
            
            XCTAssertEqual(types, ConfigurationType.allCases)
        })
    }
    
    func testGetConfigurationTypeProperties() throws {
        var channel1 = HomeChannel()
        channel1.uid = "on"
        channel1.id = "On"
        channel1.label = "Power"
        channel1.itemType = "Switch"
        
        var channel2 = HomeChannel()
        channel2.uid = "temperature"
        channel2.id = "Temperature"
        channel2.label = "Temperature"
        channel2.itemType = "Number:Temperature"
        
        var thing = Thing()
        thing.channels = [channel1, channel2]
        
        Given(externalHomeService, .getAllThings(willReturn: [thing]))
        
        try app.test(.GET, "\(homeURI)types/properties/heating", afterResponse: {response in
            let heatingProperties = try response.content.decode([HomeChannel].self)
            
            XCTAssertEqual(heatingProperties.count, 2)
            XCTAssertEqual(heatingProperties[0].id, "On")
            XCTAssertEqual(heatingProperties[0].label, "Power")
            XCTAssertEqual(heatingProperties[0].itemType, "Switch")
            
            XCTAssertEqual(heatingProperties[1].id, "Temperature")
            XCTAssertEqual(heatingProperties[1].label, "Temperature")
            XCTAssertEqual(heatingProperties[1].itemType, "Number:Temperature")
        })
        
        try app.test(.GET, "\(homeURI)types/properties/lock", afterResponse: {response in
            let lockProperties = try response.content.decode([HomeChannel].self)
            
            XCTAssertEqual(lockProperties.count, 1)
            XCTAssertEqual(lockProperties[0].id, "Lock")
            XCTAssertEqual(lockProperties[0].label, "Lock")
            XCTAssertEqual(lockProperties[0].itemType, "Switch")
        })
        
        thing.channels = nil
        Given(externalHomeService, .getAllThings(willReturn: [thing]))
        
        try app.test(.GET, "\(homeURI)types/properties/heating", afterResponse: {response in
            let heatingProperties = try response.content.decode([HomeChannel].self)
            
            XCTAssertEqual(heatingProperties.count, 0)
        })
        
        Given(externalHomeService, .getAllThings(willReturn: []))
        
        try app.test(.GET, "\(homeURI)types/properties/heating", afterResponse: {response in
            let heatingProperties = try response.content.decode([HomeChannel].self)
            
            XCTAssertEqual(heatingProperties.count, 0)
        })
    }
    
    func testGetConfigurationTypePropertiesWithFailure() throws {
        try app.test(.GET, "\(homeURI)types/properties/almafa", afterResponse: { _ in
        })
    }
    
    func testGetConfigurationProperties() throws {
        let configuration1 = try HomeConfiguration.create(type: .heating, itemNames: ["Heating_On"], state: .off, on: app.db)
        
        var item1 = Item()
        item1.name = "Heating_On"
        item1.label = "Power"
        item1.state = "ON"
        item1.type = "Switch"
        
        Given(externalHomeService, .getItem(name: "Heating_On", willReturn: item1))
        
        try app.test(.GET, "\(homeURI)properties/\(configuration1.id!)", afterResponse: { response in
            let items = try response.content.decode([Item].self)
            
            XCTAssertEqual(items.count, 1)
            XCTAssertEqual(items[0].name, "Heating_On")
            XCTAssertEqual(items[0].label, "Power")
            XCTAssertEqual(items[0].state, "ON")
            XCTAssertEqual(items[0].type, "Switch")
        })
    }
    
    func testSetPropertyState() throws {
        var item1 = Item()
        item1.name = "Heating_On"
        item1.label = "Power"
        item1.state = "ON"
        item1.type = "Switch"
        
        Given(externalHomeService, .setItemState(name: "Heating_On", newState: "ON", willReturn: true))
        Given(externalHomeService, .setItemState(name: "Heating_On", newState: "20", willReturn: false))
        
        try app.test(.POST, "\(homeURI)properties", beforeRequest: { request in
            try request.content.encode(item1)
        }, afterResponse: { response in
            XCTAssertEqual(response.status, .ok)
        })

        item1.state = "20"
        
        try app.test(.POST, "\(homeURI)properties", beforeRequest: { request in
            try request.content.encode(item1)
        }, afterResponse: { response in
            XCTAssertEqual(response.status, .internalServerError)
        })
    }
    
    func testSetPropertyStateWithFailure() throws {
        var item1 = Item()
        item1.name = nil
        item1.label = "Power"
        item1.state = nil
        item1.type = "Switch"
        
        try app.test(.POST, "\(homeURI)properties", beforeRequest: { request in
            try request.content.encode(item1)
        }, afterResponse: { response in
            XCTAssertEqual(response.status, .internalServerError)
        })
    }
    
    func testCreateHomeConfiguration() throws {
        let couch = try Couch.create(on: app.db)
        
        var item1 = Item()
        item1.name = "On"
        item1.label = "Power"
        item1.state = "on"
        item1.type = "Switch"
        
        var channel1 = HomeChannel()
        channel1.uid = "on"
        channel1.id = "On"
        channel1.label = "Power"
        channel1.itemType = "Switch"
        
        var thing = Thing()
        thing.channels = [channel1]
        
        var itemReference1 = Item()
        itemReference1.name = "Heating_On"
        itemReference1.label = "Power"
        itemReference1.state = "OFF"
        itemReference1.type = "Switch"
        
        Given(externalHomeService, .getAllThings(willReturn: [thing]))
        Given(externalHomeService, .addItem(name: "Heating_On", label: "Power", type: "Switch", willReturn: itemReference1))
        Given(externalHomeService, .linkItemToChannel(itemName: "Heating_On", channelId: "on", willReturn: true))
        Given(externalHomeService, .setItemState(name: "Heating_On", newState: "on", willReturn: true))
        
        let homeConfigurationData = CreateConfigurationData(couchId: couch.id!, name: "Heating", type: "heating", items: [item1])
        
        try app.test(.POST, "\(homeURI)items", beforeRequest: { request in
            try request.content.encode(homeConfigurationData)
        }, afterResponse: { response in
            let configuration = try response.content.decode(HomeConfiguration.self)
            
            XCTAssertEqual(configuration.name, "Heating")
            XCTAssertEqual(configuration.$couch.id, couch.id!)
            XCTAssertEqual(configuration.type, ConfigurationType.heating)
            XCTAssertEqual(configuration.itemNames, ["Heating_On"])
        })
    }
    
    func testCreateHomeConfigurationWithFailure() throws {
        let couch = try Couch.create(on: app.db)
        
        var item1 = Item()
        item1.name = "On"
        item1.label = "Power"
        item1.state = "on"
        item1.type = "Switch"
        
        var item2 = Item()
        item2.name = "Temperature"
        item2.label = "Temperature"
        item2.state = "20"
        item2.type = "Number:Temperature"
        
        var channel1 = HomeChannel()
        channel1.uid = "on"
        channel1.id = "On"
        channel1.label = "Power"
        channel1.itemType = "Switch"
        
        var channel2 = HomeChannel()
        channel2.uid = "temperature"
        channel2.id = "Temperature"
        channel2.label = "Temperature"
        channel2.itemType = "Number:Temperature"
        
        var thing = Thing()
        thing.channels = [channel1, channel2]
        
        var itemReference1 = Item()
        itemReference1.name = "Heating_On"
        itemReference1.label = "Power"
        itemReference1.state = "OFF"
        itemReference1.type = "Switch"
        
        var itemReference2 = Item()
        itemReference2.name = "Heating_Temperature"
        itemReference2.label = "Temperature"
        itemReference2.state = "20"
        itemReference2.type = "Number:Temperature"
        
        Given(externalHomeService, .getAllThings(willReturn: [thing]))
        Given(externalHomeService, .addItem(name: "Heating_On", label: "Power", type: "Switch", willReturn: itemReference1))
        Given(externalHomeService, .addItem(name: "Heating_Temperature", label: "Temperature", type: "Number:Temperature", willReturn: itemReference2))
        Given(externalHomeService, .linkItemToChannel(itemName: "Heating_On", channelId: "on", willReturn: true))
        Given(externalHomeService, .linkItemToChannel(itemName: "Heating_Temperature", channelId: "temperature", willReturn: false))
        Given(externalHomeService, .setItemState(name: "Heating_On", newState: "on", willReturn: true))
        Given(externalHomeService, .setItemState(name: "Heating_Temperature", newState: "20", willReturn: true))
        
        let homeConfigurationData = CreateConfigurationData(couchId: couch.id!, name: "Heating", type: "heating", items: [item1, item2])
        
        try app.test(.POST, "\(homeURI)items", beforeRequest: { request in
            try request.content.encode(homeConfigurationData)
        }, afterResponse: { response in
            
        })
    }
}
