//
//  LaunchArguments.swift
//  Core
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation

public enum LaunchArgument: String {

    /// flag indicates that is running on UI tests
    case uiTest = "--ui-testing"

    /// flat to clear database and userDefaults data
    case resetEnviroments = "--reset-env"

    /// flag to use fake data on API requests
    case useMockHttpRequests = "--mock-api-requests"

    /// flag to use fake errors data on API requests
    case useMockErrorHttpRequests = "--mock-error-api-requests"

    public static func check(_ argument: LaunchArgument) -> Bool {
        CommandLine.arguments.contains(argument.rawValue)
    }
}
