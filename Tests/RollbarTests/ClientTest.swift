import XCTest
@testable import Rollbar

class ClientTest: XCTestCase {
    var configuration: Configuration = Configuration(
        environment: "production"
    )

    override func setUp() {
        super.setUp()
        self.configuration = Configuration(
            environment: "production"
        )
    }

    func testInit() {
        let client = Client(
            accessToken: "abc",
            configuration: self.configuration
        )

        XCTAssertEqual(client.accessToken, "abc")
        // XCTAssertEqual(client.configuration, self.configuration)
    }
}
