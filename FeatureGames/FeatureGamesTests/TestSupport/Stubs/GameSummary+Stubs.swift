//
//  GameSummary+Stubs.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation
@testable import FeatureGames

// MARK: - GameSummary

extension GameSummary {
    static func stub(
        id: String = "",
        mandatoryTeam: Team = .stub(),
        visitorTeam: Team = .stub(),
        mandatoryTeamGoals: Int = 0,
        visitorTeamGoals: Int = 0,
        eventDate: Date = .now,
        stadiumName: String = "MARACANÃ"
    ) -> GameSummary {
        GameSummary(
            id: id,
            mandatoryTeam: mandatoryTeam,
            visitorTeam: visitorTeam,
            mandatoryTeamGoals: mandatoryTeamGoals,
            visitorTeamGoals: visitorTeamGoals,
            eventDate: eventDate,
            stadiumName: stadiumName
        )
    }
}

// MARK: - Team

extension Team {
    static func stub(
        name: String = "Flamengo",
        initials: String = "FLA",
        brandUrl: URL = .init(string: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png")!
    ) -> Team {
        Team(
            name: name,
            initials: initials,
            brandUrl: brandUrl
        )
    }
}
