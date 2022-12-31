//
//  GameHighlight.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Foundation

struct Game: Decodable {
    let id: String

    let title: String
    let description: String

    let highlights: [GameHighlight]
}

struct GameHighlight: Decodable {
    let id: String
    let description: String
    let eventDate: Date
    let type: EventType

    enum EventType: String, Decodable {
        case goal
        case normal
    }
}
