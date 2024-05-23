import Foundation
import Combine
import MapKit

  // TODO: Fill in this to retrieve current weather, and 5 day forecast by passing in a CLLocation
  ///ForecastJSONData and CurrentWeatherJSONData are the data types returned from Open Weather Service
struct WeatherService {
  /// Example function signatures. Takes in location and returns publishers that contain
//  var retrieveWeatherForecast: (CLLocation) -> DataPublisher<ForecastJSONData?>
//  var retrieveCurrentWeather: (CLLocation) -> DataPublisher<CurrentWeatherJSONData?>
}

extension WeatherService {
  static var live = WeatherService()
}
