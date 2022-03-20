//
//  StatusInfo.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

import Foundation

struct StatusInfo: Codable {
  var status       : String? = nil
  var statusDetail : String? = nil
  var description  : String? = nil

  enum CodingKeys: String, CodingKey {
    case status       = "status"
    case statusDetail = "statusDetail"
    case description  = "description"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status       = try values.decodeIfPresent(String.self , forKey: .status       )
    statusDetail = try values.decodeIfPresent(String.self , forKey: .statusDetail )
    description  = try values.decodeIfPresent(String.self , forKey: .description  )
 
  }

  init() {

  }

}
