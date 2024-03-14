//
//  EpisodeEndpoints.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
enum EpisodeEndpoints: Endpointable {
    case episode
    
    var baseUrl: String {
        return "https://rickandmortyapi.com/api"
    }
    var rawValue: String{
        return "/episode"
    }
    var fullpath: String{
        return baseUrl + rawValue
    }
}


