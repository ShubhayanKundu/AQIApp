//
//  NetworkManager.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()

    /// Performs a generic network request with the given URLRequest and apiKey.
    /// - Parameters:
    ///   - request: URLRequest to be executed.
    ///   - apiKey: The API key to be added to the request header.
    ///   - completion: A closure to pass the result of the request, returning either the decoded data or an error.
    func performRequest<T: Decodable>(request: URLRequest, apiKey: String, completion: @escaping (Result<T, Error>) -> Void) {
        var updatedRequest = request
        updatedRequest.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: updatedRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    // Other generic networking methods like post, put, delete, etc.
    // These methods will work with URLRequest as a parameter.
}

