//
//  WeatherServiceTests.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 19/07/24.
//

import XCTest
import CoreLocation
@testable import SwiftUIIntergrationProject

final class WeatherServiceTests: XCTestCase {
    var sut: WeatherServiceProtocol!
    var mockNetworkService: MockNetworkManager!
    let location = CLLocation(latitude: 0, longitude: 0)

    override func setUpWithError() throws {
        mockNetworkService = MockNetworkManager()
        sut = WeatherService(network: mockNetworkService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetrieveCurrentWeatherSuccess() async throws {
        let data = JSONFileReader.readfrom(fixturesForType: self)
        mockNetworkService.updateExpectedData(data: data)
        var result = try await sut.retrieveCurrentWeather(location: location)
        result = try XCTUnwrap(result)
        XCTAssertEqual(result.weather.first?.id, 800)
        XCTAssertEqual(result.name, "Tysons Corner")
        XCTAssertEqual(result.dt, 1716887229)
    }

    func testRetrieveCurrentWeatherFailure() async throws {
        let data = JSONFileReader.readfrom(fixturesForType: self)
        mockNetworkService.updateExpectedData(data: data)
        do {
            _ = try await sut
                .retrieveCurrentWeather(location: location)
        } catch SimpleError.dataParse {
            ///Passed
        } catch {
            XCTFail("Invalid error caught")
        }
    }

    func testRetrieveWeatherForecastSuccess() async throws {
        let data = JSONFileReader.readfrom(fixturesForType: self)
        mockNetworkService.updateExpectedData(data: data)
        var result = try await sut.retrieveWeatherForecast(location: location)
        result = try XCTUnwrap(result)
        XCTAssertEqual(result.city.name, "Tysons Corner")
        XCTAssertEqual(result.list.first?.weather.first?.id, 804)
    }

    func testRetrieveWeatherForecastFailure() async throws {
        let data = JSONFileReader.readfrom(fixturesForType: self)
        mockNetworkService.updateExpectedData(data: data)
        do {
            _ = try await sut
                .retrieveWeatherForecast(location: location)
        } catch SimpleError.dataParse {
            ///Passed
        } catch {
            XCTFail("Invalid error caught")
        }
    }

    func testInvalidCurrentWeatherAddressCase() async throws {
        /// By default both the endpoints will be nil.
        let mockWeatherEndpoint = MockWeatherEndpointProvider()
        sut = WeatherService(network: mockNetworkService, weatherResource: mockWeatherEndpoint)
        do {
            _ = try await sut.retrieveCurrentWeather(location: location)
        } catch SimpleError.address { 
            ///Passed
        }
        catch {
            XCTFail("Invalid error caught")
        }
    }

    func testInvalidWeatherForecastAddressCase() async throws {
        /// By default both the endpoints will be nil.
        let mockWeatherEndpoint = MockWeatherEndpointProvider()
        sut = WeatherService(network: mockNetworkService, weatherResource: mockWeatherEndpoint)
        do {
            _ = try await sut.retrieveWeatherForecast(location: location)
        } catch SimpleError.address {
            ///Passed
        }
        catch {
            XCTFail("Invalid error caught")
        }
    }
}
