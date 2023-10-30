//
//  CustomListView.swift
//  WiproProject
//
//  Created by admin on 30/10/23.
//

import SwiftUI

/// The main view that displays air quality data and its details.
struct ContentView: View {
    /// The view model responsible for managing the air quality data.
    @StateObject var airQualityViewModel = AirQualityViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Displaying the list of cities to select for fetching air quality data
                    AirQualityListView(viewModel: airQualityViewModel)
                        .padding(.top, 20)
                    Spacer()
                }
                .navigationTitle("Air Quality")
                
                // Creating dummy data to display in case of missing air quality data
                let dummyData = AirQualityData(CO: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              NO2: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              O3: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              SO2: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              PM2_5: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              PM10: AirQualityData.Pollutant(concentration: 0.00, aqi: 00),
                                              overall_aqi: Int(000.00))
                
                // Checking the navigation state to display AirQualityDetailsView
                if airQualityViewModel.isDetailsViewActive {
                    NavigationLink(
                        destination: AirQualityDetailsView(airQualityData: airQualityViewModel.airQualityData ?? dummyData, city: airQualityViewModel.selectedCity),
                        isActive: $airQualityViewModel.isDetailsViewActive
                    ) {
                        EmptyView()
                    }
                    .hidden() // Hiding the NavigationLink display
                }
            }
        }
    }
}
