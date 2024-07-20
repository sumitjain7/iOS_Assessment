//
//  MockWeatherService.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 20/07/24.
//

import CoreLocation
import Foundation
@testable import SwiftUIIntergrationProject

final class MockWeatherService: WeatherServiceProtocol {
    var expectedCurrentWeather: CurrentWeatherJSONData?
    var expectedForecast: ForecastJSONData?

    init(network: NetworkManagerProtocol, weatherResource: WeatherEndpoints = WeatherEndpointProvider()) {
    }

    func retrieveCurrentWeather(location: CLLocation) async throws -> CurrentWeatherJSONData {
        guard let model = expectedCurrentWeather else {
            throw SimpleError.dataLoad("No Data")
        }
        return model
    }

    func retrieveWeatherForecast(location: CLLocation) async throws -> ForecastJSONData {
        guard let model = expectedForecast else {
            throw SimpleError.dataLoad("No Data")
        }
        return model
    }
}
