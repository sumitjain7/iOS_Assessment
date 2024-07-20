//
//  Environment.swift
//  SwiftUIIntergrationProject
//
//  Created by Yuchen Nie on 4/8/24.
//

import Foundation
import ReactiveSwift

public struct Environment {
  var scheduler: ReactiveSwift.Scheduler = QueueScheduler(qos: .userInitiated, name: "userInitiated")
  var backgroundScheduler: DateScheduler = QueueScheduler(qos: .background, name: "background")
  var runLoop: RunLoop = .main
/// Removing the shared instance of network service instance.
//  var weatherServiceReactive: WeatherService = .live
  var addressService: AddressService = .live
}

public extension Environment {
  static var current = Environment()
}
