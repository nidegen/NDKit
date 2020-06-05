//
//  Optional+Binding.swift
//  NDKit
//
//  Created by Nicolas Degen on 03.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public extension Binding {
  func getExistancBinding<T>(withDefaultInitialization defaultValue: T) -> Binding<Bool> where Value == T? {
    return Binding<Bool>(get: {
      self.wrappedValue != nil
    }) { shouldExist in
      if shouldExist && self.wrappedValue.isNil {
        self.wrappedValue = defaultValue
      } else if !shouldExist && !self.wrappedValue.isNil {
        self.wrappedValue = nil
      }
    }
  }
}

public extension Optional {
  var isNil: Bool {
    return self == nil
  }
}
