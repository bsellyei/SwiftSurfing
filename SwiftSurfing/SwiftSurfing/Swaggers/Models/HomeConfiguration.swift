//
// HomeConfiguration.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct HomeConfiguration: Codable {

    public var _id: String?
    public var couch: APICouch?
    public var type: ConfigurationType?
    public var state: ItemState?

    public init(_id: String?, couch: APICouch?, type: ConfigurationType?, state: ItemState?) {
        self._id = _id
        self.couch = couch
        self.type = type
        self.state = state
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case couch
        case type
        case state
    }


}

