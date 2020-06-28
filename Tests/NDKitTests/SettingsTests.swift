//
//  SettingsTests.swift
//  NDKit
//
//  Created by Nicolas Degen on 11.06.20.
//

import XCTest
@testable import NDKit


class Foo: ObservableObject {
  @Setting(key: "TestKey")
  var number = 5
}

final class SettingsTests: XCTestCase {
  
  func testLast()  {
    let foo = Foo()
    
    foo.number = 4
    
    XCTAssertEqual(foo.number, 4)
  }
}
