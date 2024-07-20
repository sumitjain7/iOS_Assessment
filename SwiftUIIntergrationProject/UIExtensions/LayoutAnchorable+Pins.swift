//
//  LayoutAnchorable+Pins.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation
import UIKit

public protocol LayoutAnchorable {
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var heightAnchor: NSLayoutDimension { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
}

extension UIView: LayoutAnchorable {}
extension UILayoutGuide: LayoutAnchorable {}

extension LayoutAnchorable {
    public func constraints(
        pinningTo other: LayoutAnchorable,
        edges: LayoutConstrainingEdges = .all,
        insets: LayoutConstrainingInsets = 0,
        priority: UILayoutPriority = .required
    )
        -> LayoutConstraining {
        [
            edges.contains(.top) ? topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top) : nil,
            edges.contains(.leading) ? leadingAnchor.constraint(equalTo: other.leadingAnchor,
                                                                constant: insets.leading) : nil,
            edges.contains(.bottom) ? bottomAnchor.constraint(equalTo: other.bottomAnchor,
                                                              constant: -insets.bottom) : nil,
            edges.contains(.trailing) ? trailingAnchor.constraint(equalTo: other.trailingAnchor,
                                                                  constant: -insets.trailing) : nil
        ].map { $0?.with(priority: priority) }
    }
}
