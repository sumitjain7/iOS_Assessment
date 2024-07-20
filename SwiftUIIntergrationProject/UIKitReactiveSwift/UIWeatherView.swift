//
//  UIWeatherView.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import UIKit

class UIWeatherView: UIView {
    let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.allowsSelection = true
        return collection
    }()

    let bgImage: UIImageView = {
        let imagev = UIImageView(image: UIImage(named: "bgWeather")!)
        imagev.contentMode = .scaleAspectFill
        return imagev
    }()
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) in
            var item: NSCollectionLayoutItem
            var group: NSCollectionLayoutGroup
            var section: NSCollectionLayoutSection
            if sectionIndex == 0 {
                item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalHeight(1.0)))
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(100.0)), subitems: [item])
                group.contentInsets = .init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
            } else if sectionIndex == 1 {
                item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0)), subitems: [item])
                group.contentInsets = .init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
                section = NSCollectionLayoutSection(group: group)
            } else {
                item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalHeight(1.0)))
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.60), heightDimension: .absolute(400.0)), subitems: [item])
                group.contentInsets = .init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
                section = NSCollectionLayoutSection(group: group)
                
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
                section.orthogonalScrollingBehavior = .groupPaging
            }
            return section
        }
        return layout
    }

    func loadUI() {
        collectionView.collectionViewLayout = createLayout()
        addAutoLayoutSubView(subview: collectionView)
        setupConstraint()
        collectionView.backgroundView = bgImage
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
