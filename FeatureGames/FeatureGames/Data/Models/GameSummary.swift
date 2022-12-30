//
//  GameSummary.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation

struct GameSummary: Decodable {
    let id: String

    let mandatoryTeam: Team
    let visitorTeam: Team

    let mandatoryTeamGoals: Int
    let visitorTeamGoals: Int

    let eventDate: Date
    let stadiumName: String
}
