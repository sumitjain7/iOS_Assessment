//
//  AddressServiceMock.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Yuchen Nie on 4/10/24.
//

import Foundation
import MapKit
import ReactiveSwift
import Combine

@testable import SwiftUIIntergrationProject

extension AddressService {
  static var mock = AddressService(
    coordinatesProducer: coordinatesMock,
    asyncCoordinate: asyncCoordinateMock,
    coordinatePublisher: coordinatePubMock,
    coordinatesCompletion: coordinatesCompMock
  )
}

extension AddressService {
  static func coordinatesMock(from address: String) -> SignalProducer<CLLocation?, SimpleError>{
    .init(value: .init(latitude: 0, longitude: 0))
  }
  
  static func asyncCoordinateMock(from address: String) async -> CLLocation? {
    return .init(latitude: 0, longitude: 0)
  }
  
  static func coordinatePubMock(from address: String) -> AnyPublisher<CLLocation?, SimpleError> {
    Just(CLLocation.init(latitude: 0, longitude: 0))
      .mapError(handleError)
      .eraseToAnyPublisher()
  }
  
  static func coordinatesCompMock(from address: String, completion: ((CLLocation?, SimpleError?) -> Void)?) {
    completion?(.init(latitude: 0, longitude: 0), nil)
  }
}

private func handleError(error: Never) -> SimpleError {
  .address
}
