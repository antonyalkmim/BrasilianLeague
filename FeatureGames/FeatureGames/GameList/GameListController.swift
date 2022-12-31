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

    private lazy var refreshControl = UIRefreshControl()
    private lazy var rootView = GameListView(
        onSelectGame: weakify { $0.viewModel.selectGame($1) }
    )

    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = L10n.List.title
        setupActions()
        loadGames()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectAll()
    }

    override func loadView() {
        view = rootView
        rootView.tableView.refreshControl = refreshControl
    }

    private func setupActions() {
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }

    private func loadGames() {
        Task(priority: .userInitiated) {
            refreshControl.beginRefreshing()
            let state = await viewModel.getGames()
            rootView.bind(state: state)
            refreshControl.endRefreshing()
        }
    }

    @objc
    private func refreshAction() {
        loadGames()
    }

}
