//
//  View+Section.swift
//  NDKit
//
//  Created by Nicolas Degen on 28.03.20.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

public extension View {
  func section() -> some View {
    Section() {
      self
    }
  }
  
  func section(header: String) -> some View {
    Section(header: Text(header)) {
      self
    }
  }
  
  func section(header: String, footer: String) -> some View {
    Section(header: Text(header), footer: Text(footer)) {
      self
    }
  }
}
