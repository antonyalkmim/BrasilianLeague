//
//  GameServiceMock.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation
@testable import FeatureGames

extension GamesService {
    static func mock() -> GamesService {
        GamesService(
            listGames: { fatalError("method should be overriden") }
        )
    }
}
