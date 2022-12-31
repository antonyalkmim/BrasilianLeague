//
//  GameDetailsViewModel.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import Foundation

struct GameDetailsViewModel {

    let gameSummary: GameSummary

    private let service: GamesService

    // MARK: Initializers

    init(
        gameSummary: GameSummary,
        service: GamesService = .live()
    ) {
        self.gameSummary = gameSummary
        self.service = service
    }

    // MARK: Inputs

    func loadGameDetails() async -> State {
        do {
            let items = try await service.getGameDetails(gameSummary.id)
            return .loaded(items)
        } catch {
            return State.error(error)
        }
    }

    // MARK: State

    enum State {
        case loaded(Game)
        case error(Error)
    }

}
