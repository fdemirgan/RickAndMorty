//
//  CharacterDetailDataProviderProtocol.swift
//  RickAndMorty
//
//  Created by Ferhat on 11.02.2024.
//

import Foundation

protocol CharacterDetailDataProviderProtocol {
    func fetchEpisode(endpoint: CharacterEndpoints, completion: @escaping (Result<EpisodeResponse, RickAndMortyApiError>) -> ())
}
