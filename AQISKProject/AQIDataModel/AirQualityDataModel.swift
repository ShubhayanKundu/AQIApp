//
//  JokeModel.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation

/// Struct representing Air Quality Data with pollutant concentrations and AQI.
struct AirQualityData: Codable {
    /// Struct representing a specific pollutant's concentration and AQI.
    struct Pollutant: Codable {
        let concentration: Double
        let aqi: Int
    }

    // MARK: - Properties

    let CO: Pollutant
    let NO2: Pollutant
    let O3: Pollutant
    let SO2: Pollutant
    let PM2_5: Pollutant
    let PM10: Pollutant
    let overall_aqi: Int

    // MARK: - Coding Keys

    /// Enum for customizing the JSON decoding keys.
    private enum CodingKeys: String, CodingKey {
        case CO, NO2, O3, SO2, PM2_5 = "PM2.5", PM10, overall_aqi
    }
}
