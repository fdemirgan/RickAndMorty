//
//  RMCharacters.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
import UIKit

struct RMCharacters: Decodable {
    let characters: [CharacterResult]?
    let info: info?
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
        case info
    }
}
struct info: Decodable {
    let next: String?
}
struct CharacterResult: Decodable { // sadece GET işlemi yapacağım için decodable kullandım.
    let id: Int?
    let name: String?
    let status: CharacterStatus?
    let species: String?
    let gender: String?
    let location: Location?
    let image: URL?
    let episode: [URL]?   
    var statusColor: UIColor {
           switch status {
           case .alive:
               return .green
           case .dead:
               return .red
           case .unknown:
               return .gray
           case .none:
               return .clear
           }
       }
}
struct Location: Decodable{
    let name: String?
}
enum CharacterStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
