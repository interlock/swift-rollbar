import Rollbar
import NIO

let configuration: Rollbar.Configuration = Rollbar.Configuration(environment: "testing")
let client: Client = Client(
    accessToken: "",
    configuration: configuration,
    eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1),
    transportType: AsyncTransport.self
)

enum Throwables: Error {
    case interesting(message: String)
}

func IThrow() throws {
    throw Throwables.interesting(message: "I throw")
}

print("About to throw")

do {
    try IThrow()
} catch Throwables.interesting(let message) {
    print("thrown with message: ", message)
    client.error(message: message)
}

try! client.shutdown()