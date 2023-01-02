//
//  AppDelegate+LaunchArguments.swift
//  BrasilianLeague
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation
import UIKit
import Core

extension AppDelegate {

    func processLaunchArguments() {

        #if DEBUG

        if LaunchArgument.check(.uiTest) {
            UIView.setAnimationsEnabled(false)
        }

        if LaunchArgument.check(.resetEnviroments) {
            Current.cache().removeAllCachedResponses()
        }

        if LaunchArgument.check(.useMockHttpRequests) {
            Current.apiClient = { HttpServiceSuccessMoked() }
        }

        if LaunchArgument.check(.useMockErrorHttpRequests) {
            Current.apiClient = { HttpServiceErrorMoked() }
        }

        #endif
    }
}

#if DEBUG
private class HttpServiceSuccessMoked: HttpService {

    @discardableResult
    override func request<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response {
        switch endpoint.path {
        case "/games":
            return try Files.getJSON(name: "getGames", in: .main).decodeFromAPI()

        case "/games/38f2baf1-d8fb-430d-b730-e463e1f3f658":
            return try Files.getJSON(name: "getGameDetails", in: .main).decodeFromAPI()

        default:
            throw NetworkError.unknow(nil)
        }
    }

}

private class HttpServiceErrorMoked: HttpService {

    @discardableResult
    override func request<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response {
        throw NetworkError.unknow(nil)
    }

}

#endif
