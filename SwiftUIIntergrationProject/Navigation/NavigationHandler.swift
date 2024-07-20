//
//  NavigationHandler.swift
//  SwiftUIIntergrationProject
//
//  Created by Yuchen Nie on 4/4/24.
//

import Foundation
import UIKit

extension UIViewController {
  func handle(action: DemoType) {
    switch action {
    case .uiKit:
      break
    case .swiftUI:
      navigateSwiftUIView()
    }
  }
  
  private func navigateSwiftUIView() {
    let controller = SwiftUIController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
