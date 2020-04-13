import AsyncHTTPClient
import NIO

enum RollbarLevel: String {
    case debug = "debug"
    case info = "info"
    case warning = "warning"
    case error = "error"
    case critical = "critical"
}

typealias ExtraData = [String: String]
typealias CheckIgnoreFunc = (_ data: [String: Any]) -> Bool

let DEFAULT_URL = "https://asdf"

class Client {
    let accessToken: String
    let url: String
    var configuration: Configuration
    var httpClient: HTTPClient
    var eventLoopGroup: EventLoopGroup
    var transport: Transport

    init(accessToken: String, configuration: Configuration, eventLoopGroup: EventLoopGroup, transportType: Transport.Type) {
        self.accessToken = accessToken
        self.url = DEFAULT_URL
        self.configuration = configuration
        self.eventLoopGroup = eventLoopGroup
        self.httpClient = HTTPClient(eventLoopGroupProvider: .shared(eventLoopGroup))
        self.transport = transportType.init(configuration)
    }

    init(accessToken: String, url: String, configuration: Configuration, eventLoopGroup: EventLoopGroup, transportType: Transport.Type) {
        self.accessToken = accessToken
        self.url = url
        self.configuration = configuration
        self.eventLoopGroup = eventLoopGroup
        self.httpClient = HTTPClient(eventLoopGroupProvider: .shared(eventLoopGroup))
        self.transport = transportType.init(configuration)
    }

    func log(level: RollbarLevel, message: String? = nil, exception: Error? = nil, extraData: ExtraData? = nil, context: String? = nil) {
        let body = BuildBody(
            configuration: self.configuration,
            level: level,
            title: message ?? "None",
            extraData: extraData
        )
        // Add Error
        if var b = body.data.body {
            b["trace_chain"] = ""
        }
        if self.configuration.fingerprint == true {
            //body.data.fingerprint = ""
        }
        self.transport.Send(body)
    }

    func debug(message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        self.log(level: RollbarLevel.debug, message: message, exception: exception, extraData: extraData, context: context)
    }

    func info(message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        self.log(level: RollbarLevel.info, message: message, exception: exception, extraData: extraData, context: context)
    }

    func warning(message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        self.log(level: RollbarLevel.warning, message: message, exception: exception, extraData: extraData, context: context)
    }

    func error(message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        self.log(level: RollbarLevel.error , message: message, exception: exception, extraData: extraData, context: context)
    }

    func critical(message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        self.log(level: RollbarLevel.critical, message: message, exception: exception, extraData: extraData, context: context)
    }

    func setCheckIgnore(func: CheckIgnoreFunc) {

    }

    func recordViewEventForLevel(level: RollbarLevel, element: String, extaData: ExtraData?) {

    }

    func recordNetworkEvent(level: RollbarLevel, method: String, url: String, statusCode: String?, extraData: ExtraData?) {

    }

    func recordConnectivityEvent(level: RollbarLevel, status: String, extraData: ExtraData?) {

    }

    func recordErrorEvent(level: RollbarLevel, message: String, extraData: ExtraData?) {

    }
    
    func recordNavigationEvent(level: RollbarLevel, from: String, to: String, extraData: ExtraData?) {

    }

    func recordManualEvent(level: RollbarLevel, withData: ExtraData) {

    }

    func shutdown() throws {
        try self.httpClient.syncShutdown()
    }
}
