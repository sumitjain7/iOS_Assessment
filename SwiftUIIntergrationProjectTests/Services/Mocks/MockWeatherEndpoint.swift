//
//  MockWeatherEndpoint.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation
import CoreLocation
@testable import SwiftUIIntergrationProject

class MockWeatherEndpointProvider: WeatherEndpoints {
    var expectedCurrentWeatherURL: URL?
    var extectedForeCastUrl: URL?

    func currentWeatherURL(location: CLLocation) -> URL? {
        return expectedCurrentWeatherURL
    }

    func forecastURL(location: CLLocation) -> URL? {
        return extectedForeCastUrl
    }
}

