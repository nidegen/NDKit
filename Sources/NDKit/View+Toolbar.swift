//
//  View+Toolbar.swift
//  NDKit
//
//  Created by Nicolas Degen on 07.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI
import SwiftUIBlurView

extension View {
  public func toolbar<V>(height: CGFloat = 40, @ViewBuilder _ content: () -> V) -> some View where V : View {
    ZStack {
      self
      VStack {
        Spacer()
        ZStack {
          BlurView(style: .systemChromeMaterial)
          HStack(content: content).padding(.horizontal)
        }
        .frame(height: height)
      }
    }
  }
}
