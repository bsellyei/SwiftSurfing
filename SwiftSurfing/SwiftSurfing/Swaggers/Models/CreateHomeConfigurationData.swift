//
// CreateHomeConfigurationData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct CreateHomeConfigurationData: Codable {

    public var couchId: String?
    public var name: String?
    public var type: String?
    public var items: [APIItem]?

    public init(couchId: String?, name: String?, type: String?, items: [APIItem]?) {
        self.couchId = couchId
        self.name = name
        self.type = type
        self.items = items
    }


}

