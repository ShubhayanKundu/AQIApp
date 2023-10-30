//
//  AirQualityDetailsView.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
import SwiftUI

/// A view displaying details of air quality data for a specific city.
struct AirQualityDetailsView: View {
    /// The air quality data to be displayed.
    var airQualityData: AirQualityData
    /// The name of the city.
    var city: String

    var body: some View {
        List {
            Section(header: Text("Air Quality Details")) {
                CustomListRowView(rowIcon: "info.circle", rowLabel: "CO", rowValue: "\(airQualityData.CO.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "NO2", rowValue: "\(airQualityData.NO2.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "O3", rowValue: "\(airQualityData.O3.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "SO2", rowValue: "\(airQualityData.SO2.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "PM2.5", rowValue: "\(airQualityData.PM2_5.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "PM10", rowValue: "\(airQualityData.PM10.concentration)", rowTintColor: .cyan)
                CustomListRowView(rowIcon: "info.circle", rowLabel: "Overall AQI", rowValue: "\(airQualityData.overall_aqi)", rowTintColor: .cyan)
            }
            Section(header: Text("City")) {
                Text("City: \(city)")
            }
        }
    }
}

