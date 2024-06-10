//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Sean Lee on 6/9/24.
//

import Foundation

final class RMCharacterDetailViewViewModel {
  private let character: RMCharacter
  
  init(character: RMCharacter) {
    self.character = character
  }
  
  public var title: String {
    character.name.uppercased()
  }
}
