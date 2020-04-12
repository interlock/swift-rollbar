import XCTest

import RollbarTests

var tests = [XCTestCaseEntry]()
tests += RollbarTests.__allTests()

XCTMain(tests)
