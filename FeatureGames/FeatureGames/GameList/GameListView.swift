//
//  GameListView.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import TinyConstraints
import UIKit

final class GameListView: ContainerView {

    private var items: [GameSummary] = []
    private let onSelectGame: (GameSummary) -> Void

    // MARK: - Subviews

    lazy var errorView = HeroView() .. {
        $0.isHidden = true
    }

    lazy var tableView = UITableView() .. {
        $0.register(GameListCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.separatorInset = .zero
    }

    // MARK: - Initializer

    init(onSelectGame: @escaping (GameSummary) -> Void) {
        self.onSelectGame = onSelectGame
        super.init()
    }

    // MARK: - View Setup

    override func configureSubviews() {
        addSubview(tableView)
        addSubview(errorView)

        backgroundColor = .systemBackground
    }

    override func configureConstraints() {
        tableView.edgesToSuperview()
        errorView.edgesToSuperview()
    }

    func bind(state: GameListViewModel.State) {
        switch state {
        case let .loaded(games): showGames(games)
        case .empty: showEmptyState()
        case let .error(error): errorView.showError(error)
        }
    }

    func showGames(_ games: [GameSummary]) {
        // reset state
        errorView.isHidden = true

        // reload data
        self.items = games
        tableView.reloadData()
    }

    func showEmptyState() {
        tableView.reloadData()
        errorView.isHidden = false
        errorView.imageView.image = UIImage(systemName: "doc")
        errorView.titleLabel.text = L10n.List.Error.Empty.title
        errorView.messageLabel.text = L10n.List.Error.Empty.message
    }

}

// MARK: - UITableViewDataSource

extension GameListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(type: GameListCell.self, indexPath: indexPath) .. {
            $0.bind(game: items[indexPath.row])
        }
    }
}

// MARK: - UITableViewDelegate

extension GameListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectGame(items[indexPath.row])
    }
}
