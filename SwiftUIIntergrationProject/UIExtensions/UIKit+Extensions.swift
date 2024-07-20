//
//  UIKit+Extensions.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation
import UIKit

extension UIView {
    func addAutoLayoutSubView(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
}
