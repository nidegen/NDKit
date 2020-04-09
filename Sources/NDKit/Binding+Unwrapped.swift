//
//  Binding+Unwrapped.swift
//  NDKit
//
//  Created by Nicolas Degen on 09.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public extension Binding where Value == String? {
  var unwrapped: Binding<String> {
    return Binding<String>(get: {
      self.wrappedValue ?? ""
    }) { new in
      self.wrappedValue = new
    }
  }
}
public extension Binding where Value == Bool? {
  var unwrapped: Binding<Bool> {
    return Binding<Bool>(get: {
      self.wrappedValue ?? false
    }) { new in
      self.wrappedValue = new
    }
  }
}
