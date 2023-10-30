//
//  WiproProjectTests.swift
//  WiproProjectTests
//
//  Created by admin on 30/10/23.
//

import XCTest
@testable import AQISKProject

class AirQualityViewModelTests: XCTestCase {
    var airQualityViewModel: AirQualityViewModel!

    override func setUp() {
        super.setUp()
        airQualityViewModel = AirQualityViewModel()
    }

    override func tearDown() {
        airQualityViewModel = nil
        super.tearDown()
    }

    // Test method for the fetchAirQuality function
    func testFetchAirQuality() {
        // Perform a city fetch
        airQualityViewModel.fetchAirQuality(for: "Kolkata")

        // Check whether fetching is initiated
        XCTAssertTrue(airQualityViewModel.isFetchingData)

        // Simulate the passage of time for the asynchronous task
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // After fetching, check if data is available
            XCTAssertNotNil(self.airQualityViewModel.airQualityData)
            // Check whether fetching is completed
            XCTAssertFalse(self.airQualityViewModel.isFetchingData)
        }
    }

    // Test method for the navigation functionality
    func testNavigation() {
        // Initiate navigation
        airQualityViewModel.navigateToDetails()
        // Check if navigation state is active
        XCTAssertTrue(airQualityViewModel.isDetailsViewActive)

        // Perform a deactivation of the navigation
        airQualityViewModel.isDetailsViewActive = false
        // Check if the state is changed to inactive
        XCTAssertFalse(airQualityViewModel.isDetailsViewActive)
    }
}
