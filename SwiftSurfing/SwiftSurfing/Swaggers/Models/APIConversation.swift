//
// APIConversation.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct APIConversation: Codable {

    public var _id: String?
    public var users: [APIUser]?
    public var messages: [APIMessage]?

    public init(_id: String?, users: [APIUser]?, messages: [APIMessage]?) {
        self._id = _id
        self.users = users
        self.messages = messages
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case users
        case messages
    }


}
