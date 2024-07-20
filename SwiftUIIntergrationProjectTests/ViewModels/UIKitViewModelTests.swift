//
//  UIKitViewModelTests.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 20/07/24.
//

import Combine
import XCTest
@testable import SwiftUIIntergrationProject

final class UIKitViewModelTests: XCTestCase {
    var sut: UIKitViewModel!
    var mockNetworkService: MockNetworkManager!
    var mockWeatherService: MockWeatherService!
    var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        mockNetworkService = MockNetworkManager()
        mockWeatherService = MockWeatherService(network: mockNetworkService)
        sut = UIKitViewModel(weatherService: mockWeatherService, addressService: AddressService.mock, addresses: Addresses)
        cancellables = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidAddress() throws {
        mockWeatherService.expectedCurrentWeather = CurrentWeatherJSONData.createMock()
        mockWeatherService.expectedForecast = ForecastJSONData.createMock()
        XCTAssertNil(sut.weatherModel)
        let expectation = self.expectation(description: "weather viewmodels")
        sut.$weatherModel.dropFirst().sink { data in
            expectation.fulfill()
            XCTAssertNotNil(data)
        }.store(in: &cancellables)
        sut.updateAddress(address: "")
        wait(for: [expectation], timeout: 5.0)
    }

    func testInValidWeatherResponse() throws {
        mockWeatherService.expectedCurrentWeather = nil
        mockWeatherService.expectedForecast = nil
        XCTAssertNil(sut.weatherModel)
        let expectation = self.expectation(description: "weather viewmodels")
        sut.$weatherModel.dropFirst().sink { data in
            expectation.fulfill()
            XCTAssertNil(data)
        }.store(in: &cancellables)
        sut.updateAddress(address: "")
        wait(for: [expectation], timeout: 5.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
