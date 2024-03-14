//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 4.02.2024.
//

import Foundation
final class EpisodeViewModel {
    let dataProvider = EpisodeDataProvider(serviceManager: URLSessionServiceManager())
    var episodes: [RMEpisode] = []
    
    func fetchEpisodeList() {
        dataProvider.fetchLocationList(endpoint: .episode) { result in
            switch result {
            case .success(let success):
                if let rmEpisode = success.rmEpisode{
                    self.episodes = rmEpisode
                }else {
                    print(RickAndMortyApiError.noData)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
