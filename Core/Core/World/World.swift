//
//  World.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public var Current: World! // swiftlint:disable:this identifier_name

public struct World {
    public var apiClient: () -> HttpService

    public init(apiClient: @escaping () -> HttpService) {
        self.apiClient = apiClient
    }
}
