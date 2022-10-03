//
//  HomeConfiguration.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation
import Vapor
import Fluent

final class HomeConfiguration: Model, Content {
    static let schema = "homeConfigurations"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "couchId")
    var couch: Couch
    
    @Field(key: "name")
    var name: String
    
    @Enum(key: "configType")
    var type: ConfigurationType
    
    @Field(key: "itemNames")
    var itemNames: [String]
    
    @Enum(key: "state")
    var state: State
    
    init() {}
    
    init(id: UUID? = nil, couchId: Couch.IDValue, name: String, type: ConfigurationType, itemNames: [String] = [], state: State) {
        self.id = id
        self.$couch.id = couchId
        self.name = name
        self.type = type
        self.itemNames = itemNames
        
        self.state = state
    }
}

enum ConfigurationType: String, Codable, CaseIterable, Content {
    case heating = "heating"
    case cooling = "cooling"
    case weatherWatcher = "weatherWatcher"
}

enum State: String, Codable {
    case on = "on"
    case off = "off"
}
