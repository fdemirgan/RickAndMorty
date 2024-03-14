//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 11.02.2024.
//

import Foundation

protocol CharacterDetailViewModelDelegate {
    func notify(_ notify: NotifyCharacterDetailViewModel)
}

final class CharacterDetailViewModel {
    
    var episode: EpisodeResponse?
    var delegate: CharacterDetailViewModelDelegate?
    let dataProvider = CharacterDetailDataProvider(serviceManager: URLSessionServiceManager())
    
    func fetchEpisode(with episode: String) {
        dataProvider.fetchEpisode(endpoint: .episode(episode)) { result in
            switch result {
            case .success(let response):
                self.episode = response
                self.notify(with: .didFetchEpisode)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func notify(with notify: NotifyCharacterDetailViewModel) {
        DispatchQueue.main.async {
            self.delegate?.notify(notify)
        }
    }
}

enum NotifyCharacterDetailViewModel {
    case didFetchEpisode
}
