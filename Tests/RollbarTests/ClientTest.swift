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
        enum SampleError: Error {
            case bad
        }
        let client = Client(
            accessToken: "abc",
            configuration: self.configuration,
            eventLoopGroup: self.eventLoopGroup,
            transportType: TransportMock.self
        )
        defer {
            XCTAssertNoThrow(try client.shutdown())
        }

        do {
            throw SampleError.bad
        } catch {
            print("error thing: \(error)")
            Thread.callStackSymbols.forEach{print($0)}
            client.log(level: RollbarLevel.info, message: "hello", exception: error)
        }

        let transport = client.transport as? TransportMock
        let body = transport?.sent[0]
        XCTAssertEqual(body?.data.title, "hello")
    }
}
