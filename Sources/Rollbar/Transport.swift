import AnyCodable

protocol Transport {
    init(_ configuration: Configuration)
    func Send(_ body: body)
    func Wait()
    // func SetLogger()
    // func SetRetryAttempts()
    // func SetPrintPayloadOnError()
}

// class SyncTransport: Transport {

// }  

// class AsyncTransport: Transport {

// }