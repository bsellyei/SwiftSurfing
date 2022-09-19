//
//  Item.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 20..
//

import Foundation
import Vapor

struct Item: Codable, Content {

  var state      : String?   = nil
  var type       : String?   = nil
  var name       : String?   = nil
  var label      : String?   = nil

  enum CodingKeys: String, CodingKey {
    case state      = "state"
    case type       = "type"
    case name       = "name"
    case label      = "label"
  }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        state      = try values.decodeIfPresent(String.self   , forKey: .state      )
        type       = try values.decodeIfPresent(String.self   , forKey: .type       )
        name       = try values.decodeIfPresent(String.self   , forKey: .name       )
        label      = try values.decodeIfPresent(String.self   , forKey: .label      )
    }

    init() { }
}
