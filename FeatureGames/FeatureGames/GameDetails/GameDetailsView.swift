//
//  GameDetailsView.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import TinyConstraints
import UIKit

final class GameDetailsView: ContainerView {

    private var game: Game?

    // MARK: - Subviews

    private lazy var gameSummaryView = GameSummaryView()
    private lazy var errorView = HeroView() .. {
        $0.isHidden = true
    }
    private(set) var loadingView = UIActivityIndicatorView(style: .large)
    lazy var tableView = UITableView() .. {
        $0.dataSource = self
    }

    // MARK: - View Setup

    override func configureSubviews() {
        addSubview(gameSummaryView)
        addSubview(tableView)
        addSubview(errorView)
        addSubview(loadingView)

        backgroundColor = .systemBackground
    }

    override func configureConstraints() {
        gameSummaryView.edgesToSuperview(excluding: .bottom)

        tableView.topToBottom(of: gameSummaryView)
        tableView.horizontalToSuperview()
        tableView.bottomToSuperview()

        loadingView.center(in: tableView)

        errorView.edges(to: tableView)
    }

    func bind(state: GameDetailsViewModel.State) {
        switch state {
        case let .loaded(game): showGameDetails(game)
        case let .error(error): errorView.showError(error)
        }
    }

    func setGameSummary(_ game: GameSummary) {
        gameSummaryView.bind(game)
    }

    func showGameDetails(_ game: Game) {
        // reset state
        errorView.isHidden = false
        showLoading(false)

        // reload data
        self.game = game
        tableView.reloadData()
    }

    func showLoading(_ show: Bool) {
        if show {
            loadingView.startAnimating()
            loadingView.isHidden = false
        } else {
            loadingView.stopAnimating()
            loadingView.isHidden = true
        }
    }
}

// MARK: - UITableViewDataSource
extension GameDetailsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell() .. {
            $0.textLabel?.text = "Algo"
        }
    }
}
