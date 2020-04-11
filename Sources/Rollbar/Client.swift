enum RollbarLevel: String {
    case debug = "debug"
    case info = "info"
    case warning = "warning"
    case error = "error"
    case critical = "critical"
}

typealias ExtraData = [String: String]

class Client {
    let accessToken: String
    var configuration: Configuration

    init(accessToken: String, configuration: Configuration) {
        self.accessToken = accessToken
        self.configuration = configuration
    }
    func log(level: RollbarLevel, message: String?, exception: Error?, extraData: ExtraData?, context: String?) {

    }

    // func(payload: dict) bool
    func setCheckIgnore() {

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
}

enum CaptureIpType {
    case captureIpFull
    case captureIpAnonymize
    case captureIpNone
}

struct Person {
    var personId: String
    var username: String
    var email: String
}

struct ServerHost {
    var host: String
    var root: String
    var branch: String
    var codeVersion: String
}

class Configuration {
    var environment: String 
    var transmit: Bool = true
    var logPayload: Bool = false
    var captureIpType: CaptureIpType = CaptureIpType.captureIpNone
    var maximumTelemetryData: Int8 = 10
    var personId: Person?
    var serverHost: ServerHost?

    init(environment: String) {
        self.environment = environment
    }

    func setPersonId(personId: Person) {
        self.personId = personId
    }

    func setServerHost(serverHost: ServerHost) {
        self.serverHost = serverHost
    }

    func setPayloadModificationBlock() {

    }

    func addScrubField(field: String) {

    }

    func removeScrubField(field: String) {

    }

    func setRequestId(requestId: String) {

    }

    func setCaptureLogAsTelemetryData(captureLogAsTelemetry: Bool) {

    }
}