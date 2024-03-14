//
//  URLSessionServiceManager.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation
final class URLSessionServiceManager: Networking {
    func fetchData<T>(endpoint: Endpointable, parameters: [Parameterable]? = nil, completion: @escaping (Result<T, RickAndMortyApiError>) -> ()) where T : Decodable {
        
        var components = URLComponents(string: endpoint.fullpath)
        
        if let parameters = parameters {
            components?.queryItems = parameters.map({ $0.queryItem })
        }
        guard let url = components?.url
        else {
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.noData))
            }
            guard let data = data
            else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodeFail))
            }
        }.resume()
    }
}
