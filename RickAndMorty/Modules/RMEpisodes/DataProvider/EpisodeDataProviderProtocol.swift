//
//  EpisodeDataProviderProtocol.swift
//  RickAndMorty
//
//  Created by Ferhat on 4.02.2024.
//

import Foundation
protocol EpisodeDataProviderProtocol {
    func fetchLocationList(endpoint: EpisodeEndpoints, completion: @escaping (Result<RMEpisodes, RickAndMortyApiError>) -> ())
}
