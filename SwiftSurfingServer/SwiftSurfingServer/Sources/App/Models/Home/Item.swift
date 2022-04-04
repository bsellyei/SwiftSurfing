//
//  Item.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 20..
//

import Foundation
import Vapor

struct Item: Codable, Content {

  var link       : String?   = nil
  var state      : String?   = nil
  var editable   : Bool?     = nil
  var type       : String?   = nil
  var name       : String?   = nil
  var label      : String?   = nil
  var category   : String?   = nil
  var tags       : [String]? = []
  var groupNames : [String]? = []

  enum CodingKeys: String, CodingKey {
    case link       = "link"
    case state      = "state"
    case editable   = "editable"
    case type       = "type"
    case name       = "name"
    case label      = "label"
    case category   = "category"
    case tags       = "tags"
    case groupNames = "groupNames"
  }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        link       = try values.decodeIfPresent(String.self   , forKey: .link       )
        state      = try values.decodeIfPresent(String.self   , forKey: .state      )
        editable   = try values.decodeIfPresent(Bool.self     , forKey: .editable   )
        type       = try values.decodeIfPresent(String.self   , forKey: .type       )
        name       = try values.decodeIfPresent(String.self   , forKey: .name       )
        label      = try values.decodeIfPresent(String.self   , forKey: .label      )
        category   = try values.decodeIfPresent(String.self   , forKey: .category   )
        tags       = try values.decodeIfPresent([String].self , forKey: .tags       )
        groupNames = try values.decodeIfPresent([String].self , forKey: .groupNames )
    }

    init() { }
}
