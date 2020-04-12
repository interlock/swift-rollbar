import XCTest
@testable import Rollbar

class ConfigurationTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testPersonDefaults() {
        let person = Person()
        XCTAssertEqual(person.personId, "")
        XCTAssertEqual(person.username, "")
        XCTAssertEqual(person.email, "")
    }

    func testServerHostDefaults() {
        let serverHost = ServerHost()

        XCTAssertEqual(serverHost.host, "")
        XCTAssertEqual(serverHost.root, "")
        XCTAssertEqual(serverHost.branch, "")
        XCTAssertEqual(serverHost.codeVersion, "")
        XCTAssertEqual(serverHost.platform, "")
    }

    func testConfigurationDefaults() {
        let config = Configuration(environment: "production")

        XCTAssertEqual(config.environment, "production")
        XCTAssertEqual(config.accessToken, "")
        XCTAssertEqual(config.transmit, true)
        XCTAssertEqual(config.logPayload, false)
        XCTAssertEqual(config.captureIpType, CaptureIpType.captureIpNone)
        XCTAssertEqual(config.maximumTelemetryData, 10)
        XCTAssertNil(config.personId)
        XCTAssertNil(config.serverHost)
    }

    func testSetPersonId() {
        let config = Configuration(environment: "production")
        let person = Person(
            personId: "1",
            username: "user",
            email: "user@org"
        )
        config.setPersonId(personId: person)

        XCTAssertEqual(config.personId, person)
    }

    func testSetServerHost() {
        let config = Configuration(environment: "production")
        let serverHost = ServerHost(
            host: "localhost",
            root: "root",
            branch: "master",
            codeVersion: "0.1.0",
            platform: "linux"
        )

        config.setServerHost(serverHost: serverHost)

        XCTAssertEqual(config.serverHost, serverHost)
    }

    func testAddScrubField() {
        let config = Configuration(environment: "production")
        config.addScrubField(field: "test.field")

        XCTAssertEqual(config.scrubFields, ["test.field"])
        
        config.addScrubField(field: "test.otherfield")
        XCTAssertEqual(config.scrubFields, ["test.field", "test.otherfield"])
    }

    func testRemoveScrubField() {
        let config = Configuration(environment: "production")
        config.addScrubField(field: "test.field")

        config.removeScrubField(field: "test.field")
        XCTAssertEqual(config.scrubFields, [])
    }
}