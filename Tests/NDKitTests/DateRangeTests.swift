//
//  DateRangeTests.swift
//  NDKit
//
//  Created by Nicolas Degen on 31.05.20.
//

import XCTest
@testable import NDKit


final class DateRangeTests: XCTestCase {
  
  func testLast()  {
    let now = Date()
    XCTAssertFalse(now.isInLastWeek)
    
    let todaylastWeek = Date(timeIntervalSinceNow: -7 * 24 * 3600)
    XCTAssertTrue(todaylastWeek.isInLastWeek)
    
    let todaytwoMonthsAgo = Date(timeIntervalSinceNow: -61 * 24 * 3600)
    // This may fail as n ot all months are equally long
    XCTAssertTrue(todaytwoMonthsAgo.isIn(.preceeding(by: 2, .month)))
  }
}
