//
//  LocationDataProviderProtocol.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
protocol LocationDataProviderProtocol {
    func fetchLocationList(endpoint: LocationEndpoints, parameters: [LocationParameter]?, completion: @escaping (Result<RMLocations, RickAndMortyApiError>) -> ())
}
