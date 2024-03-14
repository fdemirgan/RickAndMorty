//
//  LocationParameter.swift
//  RickAndMorty
//
//  Created by Ferhat on 11.02.2024.
//

import Foundation
enum LocationParameter: Parameterable {
    case page(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .page(let value):
            return URLQueryItem(name: "page", value: value)
        }
    }
}
