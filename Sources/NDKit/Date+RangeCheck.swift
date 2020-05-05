//
//  Date+RangeCheck.swift
//  NDKit
//
//  Created by Nicolas Degen on 02.05.20.
//  Copyright © 2020 Echo Labs AG. All rights reserved.
//

import Foundation

public extension DateInterval {
  static func current(_ component: Calendar.Component) -> DateInterval {
    let now = Date()
    guard let interval = Calendar.current.dateInterval(of: component, for: now) else { return DateInterval(start: now, end: now) }
    return interval
  }
  
  static func preceeding(by periods: Int, _ component: Calendar.Component) -> DateInterval {
    let now = Date()
    let dummy = DateInterval(start: now, end: now)
    guard let date = Calendar.current.date(byAdding: component, value: periods, to: now) else { return dummy }
    guard let interval = Calendar.current.dateInterval(of: component, for: date) else { return dummy }
    return interval
  }
}

public extension Date {
  func isIn(_ interval: DateInterval) -> Bool {
    let range = interval.start...interval.end
    return range.contains(self)
  }
}
