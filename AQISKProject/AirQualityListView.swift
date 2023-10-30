//
//  AirQualityListView.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import Foundation
import SwiftUI

/// A view presenting a list of cities with the ability to fetch air quality data for each city.
struct AirQualityListView: View {
    @ObservedObject var viewModel: AirQualityViewModel

    /// An array containing tuples of icon name, city name, and tint color for each city.
    let cities = [
        ("location", "Kolkata", Color.blue),
        ("location", "Mumbai", Color.green),
        ("location", "Bangalore", Color.orange)
    ]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(cities, id: \.1) { icon, cityName, tintColor in
                Button(action: {
                    viewModel.fetchAirQuality(for: cityName)
                }) {
                    HStack {
                        // CustomListRowView to display city with an icon and color indicator.
                        CustomListRowView(rowIcon: icon, rowLabel: cityName, rowValue: "", rowTintColor: tintColor)
                            .padding(.vertical, 5)
                        Spacer()
                    }
                }
            }

            // Displays a progress view when air quality data is being fetched.
            if viewModel.isFetchingData {
                ProgressView("Fetching data...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
                    .padding(.bottom, 20) // Adjustable spacing based on design
            }
        }
        .padding(.horizontal, 20)
    }
}
