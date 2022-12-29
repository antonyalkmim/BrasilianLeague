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
    private lazy var rootView = GameListView()

    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Jogos"
        rootView.setItems(viewModel.getGames())
    }

    override func loadView() {
        view = rootView
    }

}
