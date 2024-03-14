//
//  RMEpisodes.swift
//  RickAndMorty
//
//  Created by Ferhat on 4.02.2024.
//

import Foundation
struct RMEpisodes: Decodable {
    var rmEpisode: [RMEpisode]?
    
    enum CodingKeys: String, CodingKey {
        case rmEpisode = "results"
    }
}
struct RMEpisode: Decodable {
    var id: Int?
    var name: String?
    var episode: String?
}
