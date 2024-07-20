//
//  UIKitViewModel.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 20/07/24.
//

import Combine
import Foundation

protocol ViewModelProtocol {
    var addresses: [String] { get }
}

class UIKitViewModel: ViewModelProtocol {
    @Published var addresses: [String]
    @Published var weatherModel: WeatherDisplayData?


    let weatherService: WeatherServiceProtocol
    let addressService: AddressService
    var currentAddress: String?

    init(weatherService: WeatherServiceProtocol, addressService: AddressService, addresses: [String]) {
        self.weatherService = weatherService
        self.addressService = addressService
        self.addresses = addresses.compactMap{$0}
//        updateAddress(address: self.addresses.first!)
    }

    func updateAddress(address: String) {
        currentAddress = address
        Task {
            do {
                let loc = try await self.addressService.asyncCoordinates(address)
                async let currentWeatherAPI = try weatherService.retrieveCurrentWeather(location: loc!)
                async let forecastAPI = try weatherService.retrieveWeatherForecast(location: loc!)
                
                let (currentW, forec) = try await (currentWeatherAPI, forecastAPI)
                weatherModel = .init(currentWeather: .init(from: currentW), forecast: .init(from: forec))
            } catch {
                weatherModel = nil
            }
        }
    }
}
