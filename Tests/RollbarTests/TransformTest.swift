import XCTest
@testable import Rollbar

class TransformTest: XCTestCase {
    var configuration: Configuration = Configuration(environment: "testing")
    override func setUp() {
        super.setUp()
        configuration = Configuration(environment: "testing")
    }

    func testBuildBody() {
        let body = BuildBody(configuration: configuration, extraData: nil)

        XCTAssertEqual(body.data.environment, configuration.environment)
    }

    func testBuildCustom() {
        let custom = BuildCustom(configuration: configuration, extraData: ["hi":"gain"])
        XCTAssertNil(custom)
    }
}