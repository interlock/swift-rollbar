enum RollbarLevel: String {
    case debug = "debug"
    case info = "info"
    case warning = "warning"
    case error = "error"
    case critical = "critical"
}

typealias ExtraData = [String: String]
typealias CheckIgnoreFunc = (_ data: [String: Any]) -> Bool

class Client {
    let accessToken: String
    var configuration: Configuration

    init(accessToken: String, configuration: Configuration) {
        self.accessToken = accessToken
        self.configuration = configuration
    }

    func log(level: RollbarLevel, message: String?, exception: Error?, extraData: ExtraData?, context: String?) {
        
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
}
