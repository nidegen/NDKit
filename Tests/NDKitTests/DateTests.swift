//
//  DateTests.swift
//  NDKit
//
//  Created by Nicolas Degen on 31.05.20.
//

import XCTest
@testable import NDKit


final class DateTests: XCTestCase {
  
  func testLast()  {
    let now = Date()
    XCTAssertFalse(now.isInLastWeek)
    
    let todaylastWeek = Date(timeIntervalSinceNow: -7 * 24 * 3600)
    XCTAssertTrue(todaylastWeek.isInLastWeek)
    
    let todaytwoMonthsAgo = Date(timeIntervalSinceNow: -61 * 24 * 3600)
    // This may fail as n ot all months are equally long
    XCTAssertTrue(todaytwoMonthsAgo.isIn(.preceeding(by: 2, .month)))
  }
  
  func testStepper()  {
    let now = Date()
    var nextHour = now
    nextHour.increment(by: .hour)
    nextHour.increment(by: .minute)
    
    let interval = nextHour.timeIntervalSince(now)
    XCTAssertEqual(interval, 60 + 3600)
    
    nextHour.decrement(by: .hour)
    nextHour.decrement(by: .minute)
    
    XCTAssertEqual(nextHour.timeIntervalSince(now), 0)
  }
}
