import Foundation
import Combine
import MapKit


protocol WeatherServiceProtocol {
    init(network: NetworkManagerProtocol, weatherResource: WeatherEndpoints)
    func retrieveWeatherForecast(location: CLLocation) async throws -> ForecastJSONData
    func retrieveCurrentWeather(location: CLLocation) async throws -> CurrentWeatherJSONData
}

final class WeatherService: WeatherServiceProtocol {
    let nm: NetworkManagerProtocol
    let urlProvider: WeatherEndpoints
    init(network: NetworkManagerProtocol, weatherResource: WeatherEndpoints = WeatherEndpointProvider()) {
        self.nm = network
        self.urlProvider = weatherResource
    }

    func retrieveCurrentWeather(location: CLLocation) async throws -> CurrentWeatherJSONData {
        guard let endpoint = urlProvider.currentWeatherURL(location: location) else {
            throw SimpleError.address
        }
        return try await nm.executeRequest(url: endpoint)
    }

    func retrieveWeatherForecast(location: CLLocation) async throws -> ForecastJSONData {
        guard let endpoint = urlProvider.forecastURL(location: location) else {
            throw SimpleError.address
        }
        return try await nm.executeRequest(url: endpoint)
    }
}

//extension WeatherService {
//  static var live = WeatherService()
//}
