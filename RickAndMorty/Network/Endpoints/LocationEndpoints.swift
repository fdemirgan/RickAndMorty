//
//  LocationEndpoints.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
enum LocationEndpoints: Endpointable {
    case location
    
    var baseUrl: String{
        return "https://rickandmortyapi.com/api"
    }
    var rawValue: String{
        return "/location"
    }
    var fullpath: String{
        return baseUrl + rawValue
    }
}
