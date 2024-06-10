//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Sean Lee on 6/7/24.
//

import Foundation

enum RMCharacterStatus: String, Codable {
  case alive = "Alive"
  case dead = "Dead"
  case `unknown` = "unknown"
  
  var text: String {
    switch self {
    case .alive, .dead:
      return rawValue
    case .unknown:
      return "Unknown"
    }
  }
}
