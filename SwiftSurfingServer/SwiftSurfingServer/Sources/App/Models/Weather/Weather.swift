//
//  Weather.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 04..
//

import Foundation

struct Weather: Codable {
  var main : MainWeather?   = MainWeather()
  var name : String? = nil

  enum CodingKeys: String, CodingKey {
    case main = "main"
    case name = "name"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    main = try values.decodeIfPresent(MainWeather.self   , forKey: .main )
    name = try values.decodeIfPresent(String.self , forKey: .name )
  }

  init() { }
}
