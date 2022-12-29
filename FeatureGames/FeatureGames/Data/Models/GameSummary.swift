//
//  GameSummary.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation

struct GameSummary {
    let mandatoryTeam: Team
    let visitorTeam: Team

    let mandatoryTeamGoals: Int
    let visitorTeamGoals: Int

    let eventTime: Date
    let stadiumName: String
}
