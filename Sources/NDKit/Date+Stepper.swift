//
//  Date+Stepper.swift
//  NDKit
//
//  Created by Nicolas Degen on 18.04.19.
//  Copyright © 2020 Echo Labs AG. All rights reserved.
//

import Foundation

public extension Date {
  mutating func increment(by component: Calendar.Component) {
    Calendar.current.date(byAdding: component, value: 1,
    to: self).map {
      self = $0
    }
  }
  
  mutating func decrement(by component: Calendar.Component) {
    Calendar.current.date(byAdding: component, value: -1,
    to: self).map {
      self = $0
    }
  }
}
