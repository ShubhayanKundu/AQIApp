//
//  APIClient.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
class AirQualityAPIClient {
    let networkManager = NetworkManager.shared

    /// Fetches air quality data for the specified city using a GET request.
    /// - Parameters:
    ///   - city: The name of the city for which air quality data is to be fetched.
    ///   - apiKey: The API key for authorization.
    ///   - completion: A closure to pass the result of the request, returning either the air quality data or an error.
    func fetchAirQuality(for city: String, apiKey: String, completion: @escaping (Result<AirQualityData, Error>) -> Void) {
        guard let url = URL(string: "\(URLConstants.AQI_URL)\(city)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        networkManager.performRequest(request: request, apiKey: apiKey, completion: completion)
    }
    // ... Other methods related to the Air Quality API
}

/// Possible errors that might occur during network operations.
enum NetworkError: Error {
    case invalidURL
    case invalidData
    // Add other potential network errors here
}
