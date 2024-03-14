//
//  RMLocations.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation

struct RMLocations: Decodable {
    let rmLocation: [RMLocation]?
    let info: info?
    enum CodingKeys: String, CodingKey {
        case rmLocation = "results"
        case info
    }
}
struct RMLocation: Decodable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
}
