//
//  GameHighlight.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Foundation

struct Game: Decodable, Equatable {
    let id: String

    let title: String
    let description: String

    let highlights: [GameHighlight]
}

struct GameHighlight: Decodable, Equatable {
    let description: String
    let eventMinute: Int
    let type: EventType

    enum EventType: String, Decodable {
        case goal
        case normal
    }
}
