//
//  WeatherCollectionViewCell.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 20/07/24.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    var titleLabel: UILabel
    var currentWeather: UILabel
    var temp: UILabel
    var wind: UILabel
    var direction: UILabel
    var vstack: UIStackView
    var errorLabel: UILabel
    override init(frame: CGRect) {
        titleLabel = UILabel()
        currentWeather = UILabel()
        temp = UILabel()
        wind = UILabel()
        direction = UILabel()
        vstack = UIStackView()
        errorLabel = UILabel()
        super.init(frame: frame)
        setup()
        decorate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func decorate() {
        self.layer.borderWidth = 1.0
        titleLabel.font = UIFont.systemFont(ofSize: 22.0)
        errorLabel.font = UIFont.systemFont(ofSize: 35.0)
        errorLabel.textAlignment = .center
        self.backgroundColor = .white
        errorLabel.numberOfLines = 0
        errorLabel.text = "No location for this address."
    }

    private func setup() {
        vstack.axis = .vertical
        vstack.alignment = .center
        vstack.spacing = 4.0
        errorLabel.isHidden = true
        vstack.isHidden = false
        addAutoLayoutSubView(subview: vstack)
        vstack.addArrangedSubview(titleLabel)
        vstack.addArrangedSubview(currentWeather)
        vstack.addArrangedSubview(temp)
        vstack.addArrangedSubview(wind)
        vstack.addArrangedSubview(direction)
        addAutoLayoutSubView(subview: errorLabel)

        NSLayoutConstraint.activate([
            vstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            vstack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            vstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            vstack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            errorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            errorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0)
        ])
    }

    func applyModel(model: CurrentWeatherDisplayData?) {
        guard let model = model else {
            errorLabel.isHidden = false
            vstack.isHidden = true
            return
        }
        vstack.isHidden = false
        errorLabel.isHidden = true
        titleLabel.text = model.nameOfLocationText
        currentWeather.text = model.currentWeatherText
        temp.text = model.temperatureText
        wind.text = model.windSpeedText
        direction.text = model.windDirectionText
    }
}

#if DEBUG

extension WeatherCollectionViewCell {
    var testHook: TestHook {
        .init(target: self)
    }
    struct TestHook {
        let target: WeatherCollectionViewCell
        init(target: WeatherCollectionViewCell) {
            self.target = target
        }

        
    }
}

#endif
