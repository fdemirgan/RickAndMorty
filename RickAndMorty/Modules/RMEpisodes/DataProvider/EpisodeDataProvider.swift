//
//  EpisodeDataProvider.swift
//  RickAndMorty
//
//  Created by Ferhat on 4.02.2024.
//

import Foundation
final class EpisodeDataProvider: EpisodeDataProviderProtocol {
    
    let serviceManager: Networking
    init(serviceManager: Networking) {
        self.serviceManager = serviceManager
    }
    func fetchLocationList(endpoint: EpisodeEndpoints, completion: @escaping (Result<RMEpisodes, RickAndMortyApiError>) -> ()) {
        serviceManager.fetchData(endpoint: endpoint, parameters: nil, completion: completion)
    }
}
