//
//  GameListViewModel.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation

struct GameListViewModel {

    private weak var coordinator: GamesCoordinator?

    init(coordinator: GamesCoordinator) {
        self.coordinator = coordinator
    }

    func getGames() -> [GameSummary] {
        [
            GameSummary(
                mandatoryTeam: Team(
                    name: "Flamengo",
                    initials: "FLA",
                    brandUrl: URL(string: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png")!
                ),
                visitorTeam: Team(
                    name: "Avaí",
                    initials: "AVA",
                    brandUrl: URL(string: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60.png")!
                ),
                mandatoryTeamGoals: 1,
                visitorTeamGoals: 2,
                eventTime: Date.now,
                stadiumName: "MARACANÃ"
            ),
            GameSummary(
                mandatoryTeam: Team(
                    name: "Palmeiras",
                    initials: "PAL",
                    brandUrl: URL(string: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png")!
                ),
                visitorTeam: Team(
                    name: "Internacional",
                    initials: "INT",
                    brandUrl: URL(string: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/internacional_60x60.png")!
                ),
                mandatoryTeamGoals: 0,
                visitorTeamGoals: 3,
                eventTime: Date.now,
                stadiumName: "Beira-rio"
            )
        ]
    }
}
