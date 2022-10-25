//
//  Channel.swift
//  
//
//  Created by Séllyei Bence on 2022. 09. 19..
//

import Foundation
import Vapor

struct HomeChannel: Codable, Content {

  var uid      : String? = nil
  var id       : String? = nil
  var itemType : String? = nil
  var label    : String? = nil

  enum CodingKeys: String, CodingKey {
    case uid      = "uid"
    case id       = "id"
    case itemType = "itemType"
    case label    = "label"
  }

  init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      uid      = try values.decodeIfPresent(String.self , forKey: .uid      )
      id       = try values.decodeIfPresent(String.self , forKey: .id       )
      itemType = try values.decodeIfPresent(String.self , forKey: .itemType )
      label    = try values.decodeIfPresent(String.self , forKey: .label    )
  }

  init() { }
}
