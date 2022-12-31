//
//  Coordinator.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation
import UIKit
import Core

public enum GamesRoute: Route {
    case list
    case details(GameSummary)
}

public enum GamesResult: CoordinatorResult { }

public class GamesCoordinator: Coordinator<GamesRoute, GamesResult> {

    let navigation = NavigationController()

    public init(_ didFinish: DidFinishCallback? = nil) {
        super.init(rootViewController: navigation, didFinish)
    }

    override open func navigate(to route: GamesRoute) {
        switch route {
        case .list:
            let viewModel = GameListViewModel(coordinator: self)
            let controller = GameListController(viewModel: viewModel)
            navigation.setViewControllers([controller], animated: true)

        case let .details(summary):
            let viewModel = GameDetailsViewModel(gameSummary: summary)
            let controller = GameDetailsController(viewModel: viewModel)
            navigation.pushViewController(controller, animated: true)
        }
    }

}
