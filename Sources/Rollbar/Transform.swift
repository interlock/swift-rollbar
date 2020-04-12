import Foundation
import AnyCodable

struct body: Codable {
    var access_token: String
    var data: bodyData
}

struct bodyData: Codable {
    var environment: String = ""
    var title: String = ""
    var level: String = ""
    var timestamp: Int = 0
    var platform: String = ""
    var language: String = "swift"
    var code_version: String = ""
    var server: serverData
    var notifier: notifierData
    var custom: [String: AnyCodable]?
    var person: personData?
}

struct serverData: Codable {
    var host: String = ""
    var root: String = ""
}

struct notifierData: Codable {
    struct notifierDiagnosticData: Codable {
        var languageVersion: String = "5.0-dev"
        var configuredOptions: String = ""
    }
    var name: String = "swift-rollbar"
    var version: String = "0.0.1"
    var diagnostic: notifierDiagnosticData
}

struct personData: Codable {
    var id: String = ""
    var username: String = ""
    var email: String = ""
}

func BuildBody(configuration: Configuration, extraData: ExtraData?) -> body {

    let timestamp = 0; // TODO Unix UTC
    var data: bodyData = bodyData(
        environment: configuration.environment,
        title: "", // TODO from params
        level: "", // TODO from params
        timestamp: timestamp,
        platform: configuration.serverHost?.platform ?? "",
        language: "swift",
        code_version: configuration.serverHost?.codeVersion ?? "",
        server: serverData(
            host: configuration.serverHost?.host ?? "",
            root: configuration.serverHost?.root ?? ""
        ),
        notifier: notifierData(
            name: "swift-rollbar",
            version: "0.0.1",
            diagnostic: notifierData.notifierDiagnosticData(
                languageVersion: "5.0-dev",
                configuredOptions: ""
            )
        ),
        custom: nil,
        person: nil
    )

    let custom = BuildCustom(configuration: configuration, extraData: extraData)
    if custom != nil {
        data.custom = custom
    }

    // TODO get this from params or context or something
    let person = Person()
    if person.personId != "" {
        data.person = personData(
            id: person.personId,
            username: person.username,
            email: person.email
        )
    }

    let _body: body = body(
        access_token: configuration.accessToken,
        data: data
    )

    return _body
}

func BuildCustom(configuration: Configuration, extraData: ExtraData?) -> [String: AnyCodable]? {
    return nil
}

