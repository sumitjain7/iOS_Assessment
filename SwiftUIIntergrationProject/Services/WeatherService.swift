import Foundation
import Combine
import MapKit

  //
  ///
  /**
   TODO: Fill in this to retrieve current weather, and 5 day forecast 
   * Use func currentWeatherURL(location: CLLocation) -> URL? to get the CurrentWeatherJSONData
   * Use func forecastURL(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> URL? to get the ForecastJSONData
  
   Once you have both the JSON Data, you can map:
    * CurrentWeatherJSONData -> CurrentWeatherDisplayData
    * ForecastJSONData ->ForecastDisplayData
   Both of these DisplayData structs contains the text you can bind/map to labels and we have included convience init that takes the JSON data so you can easily map them
   */
struct WeatherService {
  /// Example function signatures. Takes in location and returns publishers that contain
//  var retrieveWeatherForecast: (CLLocation) -> DataPublisher<ForecastJSONData?>
//  var retrieveCurrentWeather: (CLLocation) -> DataPublisher<CurrentWeatherJSONData?>
}

extension WeatherService {
  static var live = WeatherService()
}
