//
//  JokeViewModel.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
import Foundation

class AirQualityViewModel: ObservableObject {
    // MARK: - Properties
    
    private let airQualityAPIClient = AirQualityAPIClient()
    
    // Published properties to observe changes in views
    @Published var airQualityData: AirQualityData?
    @Published var selectedCityAirQualityData: AirQualityData?
    @Published var isDetailsViewActive = false // Navigation state
    @Published var isFetchingData = false
    @Published var selectedCity = ""
    
    private let shared = BuildSettings.shared
    
    // MARK: - Methods
    
    /// Navigate to the details view
    func navigateToDetails() {
        isDetailsViewActive = true
    }
    
    /// Fetch air quality data for a given city
    /// - Parameters:
    ///   - city: The city for which air quality data is fetched
    func fetchAirQuality(for city: String) {
        isFetchingData = true
        
        // Simulated delay for asynchronous behavior
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.airQualityAPIClient.fetchAirQuality(for: city, apiKey: self.shared.api_key) { [weak self] result in
                
                // Back on the main queue to update UI
                DispatchQueue.main.async {
                    self?.isFetchingData = false
                    self?.selectedCity = city
                    
                    // Handle the result of the API call
                    switch result {
                    case .success(let data):
                        self?.airQualityData = data
                        self?.navigateToDetails() // Navigate to the details view
                    case .failure(let error):
                        print("Error fetching Air Quality data: \(error)")
                        // Handle error if needed
                    }
                }
            }
        }
    }
}



