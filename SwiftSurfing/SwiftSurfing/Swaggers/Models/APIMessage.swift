//
// APIMessage.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct APIMessage: Codable {

    public var _id: String?
    public var user: APIUser?
    public var conversation: APIConversation?
    public var text: String?

    public init(_id: String?, user: APIUser?, conversation: APIConversation?, text: String?) {
        self._id = _id
        self.user = user
        self.conversation = conversation
        self.text = text
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case user
        case conversation
        case text
    }


}

