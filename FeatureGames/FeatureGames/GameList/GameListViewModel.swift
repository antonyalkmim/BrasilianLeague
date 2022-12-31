//
//  GameListViewModel.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation

struct GameListViewModel {

    private weak var coordinator: GamesCoordinator?
    private let service: GamesService

    init(
        coordinator: GamesCoordinator? = nil,
        service: GamesService = .live()
    ) {
        self.coordinator = coordinator
        self.service = service
    }

    func getGames() async -> State {
        do {
            let items = try await service.listGames()
            return items.isEmpty ? .empty : .loaded(items)
        } catch {
            return State.error(error)
        }
    }

    func selectGame(_ game: GameSummary) {
        coordinator?.navigate(to: .details(game))
    }

    enum State {
        case loaded([GameSummary])
        case empty
        case error(Error)
    }
}
