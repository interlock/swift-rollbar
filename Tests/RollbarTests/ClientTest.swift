import XCTest
import NIO
@testable import Rollbar

class ClientTest: XCTestCase {
    var configuration: Configuration = Configuration(
        environment: "production"
    )
    let eventLoopGroup: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

    override func setUp() {
        super.setUp()
        self.configuration = Configuration(
            environment: "production"
        )
    }
    
    // override func cleanUp() {
    //     super.cleanUp()
    //     eventLoopGroup.shutdown()
    // }

    func testInit() {
        let client = Client(
            accessToken: "abc",
            configuration: self.configuration,
            eventLoopGroup: self.eventLoopGroup,
            transportType: TransportMock.self
        )
        defer {
            try! client.shutdown()
        }

        XCTAssertEqual(client.accessToken, "abc")
        // XCTAssertEqual(client.configuration, self.configuration)
    }

    func testLog() {
        
        let client = Client(
            accessToken: "abc",
            configuration: self.configuration,
            eventLoopGroup: self.eventLoopGroup,
            transportType: TransportMock.self
        )
        defer {
            XCTAssertNoThrow(try client.shutdown())
        }

        client.log(level: RollbarLevel.info, message: "hello")

        let transport = client.transport as? TransportMock
        let body = transport?.sent[0]
        XCTAssertEqual(body?.data.title, "hello")
    }
}
