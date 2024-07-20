//
//  WeatherCoordinator.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 20/07/24.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class WeatherCoordinator {
    let parentVc: UINavigationController
    let weatherVC: UIKitController
    init(parentVc: UINavigationController) {
        self.parentVc = parentVc
        let vm: ViewModelProtocol = UIKitViewModel(
            weatherService: WeatherService(network: NetworkManager()),
            addressService: Environment.current.addressService,
            addresses: Addresses)
        weatherVC = UIKitController(viewModel: vm)
    }

    func start() {
        parentVc.pushViewController(weatherVC, animated: true)
    }
}
