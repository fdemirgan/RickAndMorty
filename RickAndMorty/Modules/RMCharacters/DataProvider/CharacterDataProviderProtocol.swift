//
//  CharacterDataProviderProtocol.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
protocol CharacterDataProviderProtocol {
    func fetchCharacterList(endpoint: CharacterEndpoints, parameters: [CharacterParameter]?, completion: @escaping(Result<RMCharacters, RickAndMortyApiError>) -> ())
}
