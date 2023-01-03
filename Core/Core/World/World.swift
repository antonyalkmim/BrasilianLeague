//
//  World.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

// SEE: How to Control the World https://www.pointfree.co/blog/posts/21-how-to-control-the-world

import Foundation

public var Current: World! // swiftlint:disable:this identifier_name

public struct World {
    public var apiClient: () -> HttpService
    public var cache: () -> URLCache

    public init(
        apiClient: @escaping () -> HttpService,
        cache: @escaping () -> URLCache
    ) {
        self.apiClient = apiClient
        self.cache = cache
    }

    public static let mock = World(
        apiClient: { HttpService() },
        cache: { URLCache.shared }
    )
}
