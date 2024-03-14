//
//  LocationDataProvider.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
final class LocationDataProvider: LocationDataProviderProtocol {
    
   public let serviceManager: Networking
    
    init(serviceManager: Networking) {
        self.serviceManager = serviceManager
    }
    func fetchLocationList(endpoint: LocationEndpoints, parameters: [LocationParameter]?, completion: @escaping (Result<RMLocations, RickAndMortyApiError>) -> ()) {
        serviceManager.fetchData(endpoint: endpoint, parameters: parameters, completion: completion)
    }
}
