import AnyCodable
import AsyncHTTPClient

public protocol Transport {
    init(_ configuration: Configuration)
    func Send(_ client: Client, _ body: body)
    func Wait()
    // func SetLogger()
    // func SetRetryAttempts()
    // func SetPrintPayloadOnError()
}

// class SyncTransport: Transport {

// }  

public class AsyncTransport: Transport {
    let configuration: Configuration

    required public init(_ configuration: Configuration) {
        self.configuration = configuration
    }

    public func Send(_ client: Client, _ body: body) {
        print("sending: ", body)
        client.httpClient.post(url: client.url).whenComplete { result in
            switch result {
            case .failure(let error):
                print("error", error)
            case .success(let response):
                if response.status == .ok {
                    print("success")
                } else {
                    print("remote error")
                }
            }
        }
    }

    public func Wait() {

    }
}