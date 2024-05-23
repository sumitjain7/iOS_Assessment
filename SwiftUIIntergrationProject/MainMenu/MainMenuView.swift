//
//  MainMenuView.swift
//  SwiftUIIntergrationProject
//
//  Created by Yuchen Nie on 4/3/24.
//

import Foundation
import SwiftUI

enum DemoType {
  case uiKit
  case swiftUI
}

extension DemoType: CaseIterable {
  var title: String {
    switch self {
    case .uiKit:
      return "UIKit Version"
    case .swiftUI:
      return "SwiftUI Version"
    }
  }
}

protocol MainMenuViewDelegate {
  func navigate(to destination: DemoType)
}

struct MainMenuView: View {
  private let options: [DemoType] = DemoType.allCases
  let delegate: MainMenuViewDelegate?
  
  var body: some View {
    VStack {
      ForEach(options, id: \.self) { option in
        VStack {
          menuItemView(with: option)
          if option != options.last {
            Divider()
          }
        }
      }
      
      Spacer()
    }
  }
  
  @ViewBuilder
  private func menuItemView(with type: DemoType) -> some View {
    HStack(alignment: .center) {
      Text(type.title)
        .padding([.leading, .top, .bottom], 16)
        .font(.title2)
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .font(.title2)
        .padding(.trailing, 16)
    }.onTapGesture {
      delegate?.navigate(to: type)
    }
  }
}
