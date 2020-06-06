import XCTest
@testable import NDKit

final class NDKitTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(NDKit().text, "Hello, World!")
  }
  
  func testOptionalArray() {
    var optionalArray: [Int]?
    optionalArray.append(3)
    optionalArray.
    XCTAssert(optionalArray?.count == 1)
  }
  
  static var allTests = [
    ("testExample", testExample),
    ("testOptionalArray", testOptionalArray),
  ]
}
