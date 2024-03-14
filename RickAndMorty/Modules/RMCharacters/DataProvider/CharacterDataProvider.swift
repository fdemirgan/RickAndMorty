//
//  CharacterDataProvider.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
final class CharacterDataProvider: CharacterDataProviderProtocol{

    public let serviceManager: Networking

    init(serviceManager: Networking) {
        self.serviceManager = serviceManager
    }
    func fetchCharacterList(endpoint: CharacterEndpoints, parameters: [CharacterParameter]?, completion: @escaping (Result<RMCharacters, RickAndMortyApiError>) -> ()) {
        serviceManager.fetchData(endpoint: endpoint, parameters: parameters, completion: completion)
    }
}
