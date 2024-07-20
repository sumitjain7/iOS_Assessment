//
//  HeaderReusableView.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 20/07/24.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    var label: UILabel
    override init(frame: CGRect) {
        label = UILabel()
        super.init(frame: frame)
        decorate()
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func decorate() {
        self.backgroundColor = .white
        self.label.font = .systemFont(ofSize: 22.0)
        self.layer.borderWidth = 1.0
    }

    private func setup() {
        addAutoLayoutSubView(subview: label)
        label.text = "Forecast"

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
