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
        onSelectGame: weakify { $0.viewModel.selectGame($1) }
    )

    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        navigationItem.title = L10n.List.title
        rootView.setItems(viewModel.getGames())
    }

    override func loadView() {
        view = rootView
    }

    private func setupActions() {
        rootView.refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }

    @objc
    private func refreshAction() {
        Timer.scheduledTimer(
            withTimeInterval: 2,
            repeats: false,
            block: weakify { weakSelf, _ in
                weakSelf.rootView.setItems(weakSelf.viewModel.getGames())
            }
        )
    }

}
