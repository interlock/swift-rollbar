
enum CaptureIpType {
    case captureIpFull
    case captureIpAnonymize
    case captureIpNone
}

struct Person: Equatable {
    var personId: String = ""
    var username: String = ""
    var email: String = ""

    static func == (lhs: Person, rhs: Person) -> Bool {
        return
            lhs.personId == rhs.personId &&
            lhs.username == rhs.username &&
            lhs.email == rhs.email
    }
}

struct ServerHost: Equatable {
    var host: String = ""
    var root: String = ""
    var branch: String = ""
    var codeVersion: String = ""
    var platform: String = ""

    static func == (lhs: ServerHost, rhs: ServerHost) -> Bool {
        return
            lhs.host == rhs.host &&
            lhs.root == rhs.root &&
            lhs.branch == rhs.branch &&
            lhs.codeVersion == rhs.codeVersion &&
            lhs.platform == rhs.platform
    }
}

class Configuration {
    var environment: String = ""
    var accessToken: String = ""
    var transmit: Bool = true
    var logPayload: Bool = false
    var captureIpType: CaptureIpType = CaptureIpType.captureIpNone
    var maximumTelemetryData: Int8 = 10
    var personId: Person?
    var serverHost: ServerHost?
    var scrubFields: [String] = []
    var fingerprint: Bool = false
    
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
        self.scrubFields.append(field)
    }

    func removeScrubField(field: String) {
        self.scrubFields = self.scrubFields.filter() { $0 != field}
    }

    func setRequestId(requestId: String) {

    }

    func setCaptureLogAsTelemetryData(captureLogAsTelemetry: Bool) {

    }
}