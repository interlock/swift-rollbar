
func BuildBody(configuration: Configuration, extraData: ExtraData) -> [String: Any] {

    let timestamp = 0; // TODO Unix UTC
    var data: [String: Any] = [
        "environment": configuration.environment,
        "title": "", // TODO from params
        "level": "", // TODO from params
        "timestamp": timestamp,
        "platform": configuration.serverHost?.platform ?? "",
        "language": "swift",
        "code_version": configuration.serverHost?.codeVersion ?? "",
        "server": [
            "host": configuration.serverHost?.host ?? "",
            "root": configuration.serverHost?.root ?? "",
        ],
        // "notifier": [
        //     "name": "swift-rollbar",
        //     "version": "0.1",
        //     "diagnostic": [
        //         "languageVersion": "5.0-dev",
        //         "configuredOptions": []
        //     ]
        // ]
    ]

    let custom = BuildCustom(configuration: configuration, extraData: extraData)
    if custom != nil {
        data["custom"] = custom
    }

    // TODO get this from params or context or something
    let person = Person()
    if person.personId != "" {
        data["person"] = [
            "id": person.personId,
            "username": person.username,
            "email": person.email
        ]
    }

    let body: [String: Any] = [
        "access_token": configuration.accessToken,
        "data": data
    ]

    return body
}

func BuildCustom(configuration: Configuration, extraData: ExtraData) -> [String: Any]? {
    return nil
}

