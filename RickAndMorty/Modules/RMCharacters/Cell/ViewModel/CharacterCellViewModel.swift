//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
import UIKit
import Kingfisher

final class CharacterCellViewModel {
    
   public let character: CharacterResult
    init(character: CharacterResult) {
        self.character = character
    }
   public var name: String {
        return character.name ?? ""
    }
   public var lifeAndSpecies: String {
       return character.status!.rawValue
    }
    public var species: String {
        return character.species ?? ""
    }
   public var characterImage: URL {
        return character.image!
    }
   public var statusColor: UIColor {
        return character.statusColor
    }
}
