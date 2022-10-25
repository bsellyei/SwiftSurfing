//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2022. 10. 10..
//

@testable import App
import Foundation
import XCTVapor
import SwiftyMocky

let externalHomeService = IExternalHomeServiceMock()
let homeConfigurationService = IHomeConfigurationServiceMock()
let homeService = HomeService(homeConfigurationService: homeConfigurationService, externalHomeService: externalHomeService)

var thing = Thing()
var channel1 = HomeChannel()
var channel2 = HomeChannel()
var channel3 = HomeChannel()
var item1 = Item()
var item2 = Item()
var item3 = Item()

let couchId = UUID()
let configurationId = UUID()
let homeConfiguration = HomeConfiguration(id: configurationId, couchId: couchId, name: "heating", type: .heating, itemNames: ["Heating_On", "Heating_Led", "Heating_Temperature"], state: .on)

final class HomeServiceTests: XCTestCase {

    override func setUp() {
        Matcher.default.register(HomeConfiguration.self) { (lhs, rhs) -> Bool in
            guard lhs.id == rhs.id else { return false }
            guard lhs.name == rhs.name else { return false }
            guard lhs.type == rhs.type else { return false }
            guard lhs.itemNames == rhs.itemNames else { return false }
            guard lhs.state == rhs.state else { return false }
            return true
        }
        
        channel1 = HomeChannel()
        channel1.uid = "on"
        channel1.id = "On"
        channel1.label = "Power"
        channel1.itemType = "Switch"
        
        channel2 = HomeChannel()
        channel2.uid = "led"
        channel2.id = "Led"
        channel2.label = "LED"
        channel2.itemType = "Switch"
        
        channel3 = HomeChannel()
        channel3.uid = "temperature"
        channel3.id = "Temperature"
        channel3.label = "Temperature"
        channel3.itemType = "Number:Temperature"
        
        thing = Thing()
        thing.channels = [channel1, channel2, channel3]
        
        item1 = Item()
        item1.name = "Heating_On"
        item1.label = "Power"
        item1.state = "ON"
        item1.type = "Switch"
        
        item2 = Item()
        item2.name = "Heating_Led"
        item2.label = "LED"
        item2.state = "OFF"
        item2.type = "Switch"
        
        item3 = Item()
        item3.name = "Heating_Temperature"
        item3.label = "Temperature"
        item3.state = "20"
        item3.type = "Number:Temperature"
    }
    
    func testGetItemsForHomeConfiguration() async throws {
        Given(homeConfigurationService, .getHomeConfiguration(configurationId: .value(configurationId.uuidString), willReturn: homeConfiguration))
        
        Given(externalHomeService, .getItem(name: .value("Heating_On"), willReturn: item1))
        Given(externalHomeService, .getItem(name: .value("Heating_Led"), willReturn: item1))
        Given(externalHomeService, .getItem(name: .value("Heating_Temperature"), willReturn: item1))
        
        let items = try await homeService.getItemsByHomeConfiguration(configurationId: configurationId.uuidString)
        XCTAssertEqual(items.count, 3)
        
        for item in items {
            if let itemName = item.name {
                if itemName == "Heating_On" {
                    XCTAssertEqual(item.label, item1.label)
                    XCTAssertEqual(item.state, item1.state)
                    XCTAssertEqual(item.type, item1.type)
                } else if itemName == "Heating_Led" {
                    XCTAssertEqual(item.label, item2.label)
                    XCTAssertEqual(item.state, item2.state)
                    XCTAssertEqual(item.type, item2.type)
                } else if itemName == "Heating_Temperature" {
                    XCTAssertEqual(item.label, item3.label)
                    XCTAssertEqual(item.state, item3.state)
                    XCTAssertEqual(item.type, item3.type)
                }
            }
        }
    }
    
    func testAddHomeConfiguration() async throws {
        Given(homeConfigurationService, .createHomeConfigurations(configuration: .value(homeConfiguration), willReturn: homeConfiguration))
        
        Given(externalHomeService, .getAllThings(willReturn: [thing]))
        Given(externalHomeService, .addItem(name: .value("heating_On"),
                                            label: .value("Power"),
                                            type: .value("Switch"),
                                            willReturn: item1))
        Given(externalHomeService, .addItem(name: .value("heating_Led"),
                                            label: .value("LED"),
                                            type: .value("Switch"),
                                            willReturn: item2))
        Given(externalHomeService, .addItem(name: .value("heating_Temperature"),
                                            label: .value("Temperature"),
                                            type: .value("Number:Temperature"),
                                            willReturn: item3))
        Given(externalHomeService, .linkItemToChannel(itemName: .value("heating_On"), channelId: .value("on"), willReturn: true))
        Given(externalHomeService, .linkItemToChannel(itemName: .value("heating_Led"), channelId: .value("led"), willReturn: true))
        Given(externalHomeService, .linkItemToChannel(itemName: .value("heating_Temperature"), channelId: .value("temperature"), willReturn: true))
        
        let success = try await homeService.addHomeConfiguration(configuration: homeConfiguration)
        XCTAssertTrue(success)
        
        Verify(externalHomeService, 3, .addItem(name: .any, label: .any, type: .any))
        Verify(externalHomeService, 3, .linkItemToChannel(itemName: .any, channelId: .any))
    }
}
