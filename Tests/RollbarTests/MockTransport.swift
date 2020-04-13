@testable import Rollbar
import AnyCodable

class TransportMock: Transport {
    var configuration: Configuration
    var sent: [body] = []

    required init(_ configuration: Configuration) {
        self.configuration = configuration
    }

    func Send(_ body: body) {
        self.sent.append(body)
    }

    func Wait() {
    }

}