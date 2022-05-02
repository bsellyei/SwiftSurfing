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
    
    @Enum(key: "configType")
    var type: ConfigurationType
    
    @Enum(key: "state")
    var state: State
    
    init() {}
    
    init(id: UUID? = nil, couchId: Couch.IDValue, type: ConfigurationType, state: State) {
        self.id = id
        self.$couch.id = couchId
        self.type = type
        self.state = state
    }
}

enum ConfigurationType: String, Codable {
    case heating
    case cooling
    case weatherWatcher
}

enum State: String, Codable {
    case on
    case off
}
