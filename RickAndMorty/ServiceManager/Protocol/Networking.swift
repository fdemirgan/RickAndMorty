//
//  Networking.swift
//  RickAndMorty
//
//  Created by Ferhat on 27.01.2024.
//

import Foundation

enum RickAndMortyApiError: String, Error {
    case noData = "Böyle bir data yok."
    case decodeFail = "Data decode edilemedi."
    case invalidUrl = "Geçersiz URL"
    case parameterFail = "Geçersiz parametre."
}

protocol Networking {
    func fetchData<T: Decodable>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<T, RickAndMortyApiError>) -> ())
}
