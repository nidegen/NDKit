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
    guard let date = Calendar.current.date(byAdding: component, value: -periods, to: now) else { return dummy }
    guard let interval = Calendar.current.dateInterval(of: component, for: date) else { return dummy }
    return interval
  }
}

public extension Date {
  func isIn(_ interval: DateInterval) -> Bool {
    let range = interval.start...interval.end
    return range.contains(self)
  }
  
  func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
    calendar.isDate(self, equalTo: date, toGranularity: component)
  }
  
  func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
  func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
  func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }
  
  func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }
  
  var isInThisYear:  Bool { isInSameYear(as: Date()) }
  var isInThisMonth: Bool { isInSameMonth(as: Date()) }
  var isInThisWeek:  Bool { isInSameWeek(as: Date()) }
  
  var isInLastYear:  Bool { self.isIn(.preceeding(by: 1, .weekOfMonth)) }
  var isInLastMonth: Bool { self.isIn(.preceeding(by: 1, .weekOfMonth)) }
  var isInLastWeek:  Bool { self.isIn(.preceeding(by: 1, .weekOfMonth)) }
  
  var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
  var isInToday:     Bool { Calendar.current.isDateInToday(self) }
  var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }
  
  var isInTheFuture: Bool { self > Date() }
  var isInThePast:   Bool { self < Date() }
}
