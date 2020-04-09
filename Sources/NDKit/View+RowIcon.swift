//
//  View+RowIcon.swift
//  NDKit
//
//  Created by Nicolas Degen on 09.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI
import SwiftUIBlurView

extension View {
  public func rowIcon<V>(named: String, color: Color, @ViewBuilder _ content: () -> V) -> some View where V : View {
    HStack {
      RowIcon(name: named, color: color)
      self
    }
  }
}


public struct RowIcon: View {
  var name: String
  var color: Color
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 6)
        .fill(color)
        .frame(width: 30, height: 30)
      Image(systemName: name)
        .font(.system(size: 20))
        .foregroundColor(.white)
    }
  }
}
