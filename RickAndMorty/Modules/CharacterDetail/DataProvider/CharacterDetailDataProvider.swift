//
//  CharacterDetailDataProvider.swift
//  RickAndMorty
//
//  Created by Ferhat on 11.02.2024.
//

import Foundation

final class CharacterDetailDataProvider: CharacterDetailDataProviderProtocol {
    
    private let serviceManager: Networking
    
    init(serviceManager: Networking) {
        self.serviceManager = serviceManager
    }
    
    func fetchEpisode(endpoint: CharacterEndpoints, completion: @escaping (Result<EpisodeResponse, RickAndMortyApiError>) -> ()) {
        serviceManager.fetchData(endpoint: endpoint, parameters: nil, completion: completion)
    }
}
