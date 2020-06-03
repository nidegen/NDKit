//
//  Optional+Binding.swift
//  NDKit
//
//  Created by Nicolas Degen on 03.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

public extension Optional {
  mutating func getExistanceBinding(withDefaultInitialization defaultValue: Wrapped) -> Binding<Bool> {
    return Binding(get: { [weak self] in
      self != nil
    }) { [weak self] shouldExist in
      if shouldExist && self.isNil {
        self = defaultValue
      } else if !shouldExist && !self.isNil {
        self = nil
      }
    }
  }
  
  var isNil: Bool {
    return self == nil
  }
}
