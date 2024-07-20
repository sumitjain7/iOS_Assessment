//
//  UIAddressCollectionViewCell.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import UIKit

class UIAddressCollectionViewCell: UICollectionViewCell {
    private var backview: UIView
    private var label: UILabel
    override init(frame: CGRect) {
        backview = UIView()
        label = UILabel()
        super.init(frame: frame)
        setup()
        decorate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func decorate() {
        self.backview.layer.cornerRadius = 10.0
        self.backview.backgroundColor = .systemBlue
        label.textColor = .white
        label.textAlignment = .center
        self.label.numberOfLines = 0
        self.backview.layer.borderColor = UIColor.systemBlue.cgColor
        self.backview.layer.borderWidth = isSelected ? 3.0 : 0
    }

    override var isSelected: Bool {
        didSet {
            self.backview.layer.borderColor = UIColor.white.cgColor
            self.backview.layer.borderWidth = isSelected ? 3.0 : 0
        }
    }

    private func setup() {
        addAutoLayoutSubView(subview: backview)
        backview.addAutoLayoutSubView(subview: label)

        NSLayoutConstraint.activate([
            backview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backview.topAnchor.constraint(equalTo: self.topAnchor),
            backview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: backview.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: backview.centerYAnchor),
            label.widthAnchor.constraint(equalTo: backview.widthAnchor, multiplier: 1, constant: -6.0),
            label.heightAnchor.constraint(equalTo: backview.heightAnchor, multiplier: 1, constant: -6.0)
        ])
    }

    func applyModel(address: String) {
        label.text = address
    }

    override func prepareForReuse() {
        isSelected = false
    }
}
