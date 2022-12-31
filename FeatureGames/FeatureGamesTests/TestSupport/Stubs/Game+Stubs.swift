//
//  Game+Stubs.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 31/12/22.
//

import Foundation
@testable import FeatureGames

// MARK: - Game

extension Game {
    static func stub(
        id: String = "",
        title: String = "",
        description: String = "",
        highlights: [GameHighlight] = []
    ) -> Game {
        Game(
            id: id,
            title: title,
            description: description,
            highlights: highlights
        )
    }
}

// MARK: - GameHighlight

extension GameHighlight {
    static func stub(
        description: String = "",
        eventMinute: Int = 1,
        type: EventType = .normal
    ) -> GameHighlight {
        GameHighlight(description: description, eventMinute: eventMinute, type: type)
    }
}
