//
//  Thing.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

import Foundation
import Vapor

struct Thing: Codable, Content {
  var label      : String?     = nil
  var bridgeUID  : String?     = nil
  var UID        : String?     = nil
  var channels   : [Channel]?  = []
  var statusInfo : StatusInfo? = StatusInfo()

  enum CodingKeys: String, CodingKey {
    case label      = "label"
    case bridgeUID  = "bridgeUID"
    case UID        = "UID"
    case channels   = "channels"
    case statusInfo = "statusInfo"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    label      = try values.decodeIfPresent(String.self     , forKey: .label      )
    bridgeUID  = try values.decodeIfPresent(String.self     , forKey: .bridgeUID  )
    UID        = try values.decodeIfPresent(String.self     , forKey: .UID        )
    channels   = try values.decodeIfPresent([Channel].self  , forKey: .channels   )
    statusInfo = try values.decodeIfPresent(StatusInfo.self , forKey: .statusInfo )
  }

  init() { }
}
