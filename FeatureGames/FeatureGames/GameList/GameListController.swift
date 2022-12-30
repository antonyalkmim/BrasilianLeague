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
        loadGames()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectAll()
    }

    override func loadView() {
        view = rootView
    }

    private func setupActions() {
        rootView.refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }

    private func loadGames() {
        rootView.refreshControl.beginRefreshing()

        Task(priority: .userInitiated) {
            do {
                let games = try await viewModel.getGames()
                rootView.setItems(games)
            } catch {
                print(error)
            }
        }

    }

    @objc
    private func refreshAction() {
        loadGames()
    }

}
