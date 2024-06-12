//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sean Lee on 6/11/24.
//

import Foundation

protocol RMEpisodeDataRender {
  var name: String { get }
  var air_date: String { get }
  var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellViewModel {
  private let episodeUrl: URL?
  private var isFetching = false
  private var dataBlock: ((RMEpisodeDataRender) -> Void)?
  
  private var episode: RMEpisode? {
    didSet {
      guard let model = episode else {
        return
      }
      dataBlock?(model)
    }
  }
  
  // MARK: - Init
  init(episodeUrl: URL?) {
    self.episodeUrl = episodeUrl
  }
  
  // MARK: - Public
  public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
    self.dataBlock = block
  }
  
  public func fetchEpisode() {
    guard !isFetching else {
      if let model = episode {
        dataBlock?(model)
      }
      return
    }
    guard let url = episodeUrl,
          let request = RMRequest(url: url) else {
      return
    }
    isFetching = true
    
    RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
      switch result {
      case .success(let model):
        DispatchQueue.main.async {
          self?.episode = model
        }
      case .failure(let failure):
        print(String(describing: failure))
      }
    }
  }
}
