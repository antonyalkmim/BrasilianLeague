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

    func showDetails() {
        coordinator?.navigate(to: .details)
    }
}
