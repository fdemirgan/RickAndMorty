//
//  CharacterEndpoints.swift
//  RickAndMorty
//
//  Created by Ferhat on 27.01.2024.
//

import Foundation
enum CharacterEndpoints: Endpointable {
    case character
    case episode(String)
    
    var baseUrl: String{
        return  "https://rickandmortyapi.com/api"
    }
    var rawValue: String {
        switch self {
        case .character: return "/character"
        case .episode(let episode): return "/episode/\(episode)"
        }
    }
    var fullpath: String{
        return baseUrl + rawValue
    }
}
