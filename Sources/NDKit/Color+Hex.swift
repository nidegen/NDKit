//
//  Color+Hex.swift
//  NDKit
//
//  Created by Nicolas Degen on 18.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public extension Color {
  init(hex: Int, alpha: Double = 1) {
    let components = (
      R: Double((hex >> 16) & 0xff) / 255,
      G: Double((hex >> 08) & 0xff) / 255,
      B: Double((hex >> 00) & 0xff) / 255
    )
    self.init(
      .sRGB,
      red: components.R,
      green: components.G,
      blue: components.B,
      opacity: alpha
    )
  }
}
