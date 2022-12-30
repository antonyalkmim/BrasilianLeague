//
//  GamesService.swift
//  FeatureGames
//
//  Created by antony.alkmim on 30/12/22.
//

import Core
import Foundation

struct GamesService {
    var listGames: () async throws -> [GameSummary]
}

extension GamesService {
    static func live(
        apiService: HttpService = .init()
    ) -> GamesService {
        GamesService(
            listGames: { try await apiService.request(Endpoint(path: "/games")) }
        )
    }
}
