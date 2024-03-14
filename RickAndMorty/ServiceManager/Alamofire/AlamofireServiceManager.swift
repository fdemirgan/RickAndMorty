//
//  AlamofireServiceManager.swift
//  RickAndMorty
//
//  Created by Ferhat on 3.02.2024.
//

import Foundation
import Alamofire
class AlamofireServiceManager: Networking {
    func fetchData<T>(endpoint: Endpointable, parameters: [Parameterable]? = nil, completion: @escaping (Result<T, RickAndMortyApiError>) -> ()) where T : Decodable {
        
        var components = URLComponents(string: endpoint.fullpath)
        
        if let parameters = parameters {
            components?.queryItems = parameters.map({ $0.queryItem })
        }
        guard let url = components?.url else {
            completion(.failure(.invalidUrl))
            return
        }
        AF.request(url, method: .get).response { response in
            if response.error != nil {
                completion(.failure(.noData))
            }
            guard let data = response.data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            }catch {
                completion(.failure(.decodeFail))
            }
        }
    }
}
