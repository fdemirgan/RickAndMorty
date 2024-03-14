//
//  URL+Extension.swift
//  RickAndMorty
//
//  Created by Ferhat on 10.02.2024.
//

import Foundation

extension URL { //https://rickandmortyapi.com/api/character/?page=2
    var pageParameter: (key: String, value: String)? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else { return nil }
        
        for queryItem in queryItems {
            if queryItem.name == "page", let value = queryItem.value {
                return (key: queryItem.name, value: value)
            }
        }
        return nil
    }
    var lastEndpoint: String? { //https://rickandmortyapi.com/api/episode/1
        return pathComponents.last
    }
}
