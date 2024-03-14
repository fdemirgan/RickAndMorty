//
//  CharacterParameter.swift
//  RickAndMorty
//
//  Created by Ferhat on 10.02.2024.
//

import Foundation
enum CharacterParameter: Parameterable {
    case page(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .page(let page):
            return URLQueryItem(name: "page", value: page)
        }
    }
}
