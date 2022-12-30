//
//  GameCoordinatorSpy.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation
@testable import FeatureGames

class GameCoordinatorSpy: GamesCoordinator {

    var triggeredRoute: GamesRoute?

    override func navigate(to route: GamesRoute) {
        triggeredRoute = route
    }
}
