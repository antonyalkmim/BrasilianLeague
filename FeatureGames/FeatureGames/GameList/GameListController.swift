//
//  GameListController.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import UIKit

final class GameListController: Controller {

    private let viewModel: GameListViewModel
    private lazy var rootView = GameListView(
        didTapShowDetails: weakify {
            $0.viewModel.showDetails()
        }
    )

    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Jogos"
    }

    override func loadView() {
        view = rootView
    }

}
