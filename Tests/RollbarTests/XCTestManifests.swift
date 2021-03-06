#if !canImport(ObjectiveC)
import XCTest

extension ConfigurationTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ConfigurationTest = [
        ("testAddScrubField", testAddScrubField),
        ("testConfigurationDefaults", testConfigurationDefaults),
        ("testPersonDefaults", testPersonDefaults),
        ("testRemoveScrubField", testRemoveScrubField),
        ("testServerHostDefaults", testServerHostDefaults),
        ("testSetPersonId", testSetPersonId),
        ("testSetServerHost", testSetServerHost),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ConfigurationTest.__allTests__ConfigurationTest),
    ]
}
#endif
