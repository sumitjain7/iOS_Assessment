//
//  WeatherDisplayData.swift
//  SwiftUIIntergrationProject
//
//  Created by Yuchen Nie on 4/8/24.
//

import Foundation

struct WeatherDisplayData: Equatable {
  let currentWeather: CurrentWeatherJSONData
  let forecast: ForecastJSONData
  
  init(currentWeather: CurrentWeatherJSONData, forecast: ForecastJSONData) {
    self.currentWeather = currentWeather
    self.forecast = forecast
  }
}
