//
// User.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct GeneratedUser: Codable {

    public var _id: String?
    public var fullName: String?
    public var email: String?

    public init(_id: String?, fullName: String?, email: String?) {
        self._id = _id
        self.fullName = fullName
        self.email = email
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case fullName
        case email
    }


}

