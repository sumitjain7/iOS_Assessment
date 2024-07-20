//
//  ForecastCollectionViewCell.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 20/07/24.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    var date: UILabel
    var temp: UILabel
    var weather: UILabel
    var wind: UILabel
    var windDirection: UILabel
    var rain: UILabel
    var vstack: UIStackView

    override init(frame: CGRect) {
        date = UILabel()
        temp = UILabel()
        weather = UILabel()
        wind = UILabel()
        windDirection = UILabel()
        rain = UILabel()
        vstack = UIStackView()
        super.init(frame: frame)
        setup()
        decorate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        vstack.axis = .vertical
        vstack.alignment = .center
        vstack.distribution = .equalSpacing
        addAutoLayoutSubView(subview: vstack)
        vstack.addArrangedSubview(date)
        vstack.addArrangedSubview(temp)
        vstack.addArrangedSubview(weather)
        vstack.addArrangedSubview(wind)
        vstack.addArrangedSubview(windDirection)
        vstack.addArrangedSubview(rain)

        NSLayoutConstraint.activate([
            vstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            vstack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            vstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            vstack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0),
        ])
    }

    private func decorate() {
        self.layer.borderWidth = 1.0
        self.backgroundColor = .systemGray4
    }
    
    func applyModel(model: ForecastItemDisplayData?) {
        guard let model = model else {
            return
        }
        date.text = model.timeDateText
        temp.text = model.temperatureText
        weather.text = model.weatherText
        wind.text = model.windSpeedText
        windDirection.text = model.windDirectionText
        rain.text = model.rainText
    }
}
