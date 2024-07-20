//
//  UIKitReactiveController.swift
//  SwiftUIIntergrationProject
//
//  Created by Yuchen Nie on 4/5/24.
//

import Combine
import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import SnapKit

// TODO: Create UIKit View that either pre-selects address or user enters address, and retrieves current weather plus weather forecast
class UIKitController: UIViewController {
    let vm: UIKitViewModel
    private var subscriptions = Set<AnyCancellable>()
    init(viewModel: ViewModelProtocol) {
        self.vm = viewModel as! UIKitViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var weatherView: UIWeatherView {
        self.view as! UIWeatherView
    }

    override func loadView() {
        self.view = UIWeatherView()
        weatherView.loadUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupObserving()
        setupCollection()
    }

    private func setupObserving() {
        vm.$addresses.sink {_ in 
            self.weatherView.collectionView.reloadData()
        }.store(in: &subscriptions)

        vm.$weatherModel.dropFirst().receive(on: DispatchQueue.main).sink { [weak self] weatherModel in
            self?.weatherView.collectionView.reloadSections(IndexSet([1,2]))
        }.store(in: &subscriptions)
    }

    private func setupCollection() {
        weatherView.collectionView.register(UIAddressCollectionViewCell.self, forCellWithReuseIdentifier: "addressCell")
        weatherView.collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        weatherView.collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "currentWeatherCell")
        weatherView.collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: "forecastCell")
        weatherView.collectionView.dataSource = self
        weatherView.collectionView.delegate = self
    }
}

extension UIKitController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return vm.addresses.count
        } else if( section == 1) {
            return 1
        } else {
            return vm.weatherModel?.forecast.forecastItems.count ?? 0
        }
    }


    /// The cell initialization and data injection can be done using protocol approach in a cleaner way and without using the if-else condition.
    /// Not doing that way due to lack of time.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addressCell", for: indexPath)
            (cell as! UIAddressCollectionViewCell).applyModel(address: vm.addresses[indexPath.item])
        } else if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentWeatherCell", for: indexPath)
            (cell as! WeatherCollectionViewCell).applyModel(model: vm.weatherModel?.currentWeather)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath)
            (cell as! ForecastCollectionViewCell).applyModel(model: vm.weatherModel?.forecast.forecastItems[indexPath.item])
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: "header", for: indexPath)
        return view
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            vm.updateAddress(address: vm.addresses[indexPath.item])
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let cell = collectionView.cellForItem(at: indexPath) {
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.indexPathsForSelectedItems?.filter{ $0.section == indexPath.section }.forEach{
            collectionView.deselectItem(at: $0, animated: false)
        }
        return true
    }
}
