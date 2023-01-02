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

    let kDescriptionSection = 0
    let kHighlightsSection = 1

    private var game: Game?

    // MARK: - Subviews

    private lazy var gameSummaryView = GameSummaryView()
    private lazy var errorView = HeroView() .. {
        $0.isHidden = true
    }
    private(set) var loadingView = UIActivityIndicatorView(style: .large)
    lazy var tableView = UITableView() .. {
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.register(GameDetailDescriptionCell.self)
        $0.register(GameHighlightCell.self)
        $0.register(EmptyHighlightCell.self)
        $0.accessibilityIdentifier = "game_details_tableview"
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
        case let .error(error):
            showLoading(false)
            errorView.showError(error)
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

    func numberOfSections(in tableView: UITableView) -> Int {
        game != nil ? 3 : 0 // description + highlights
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let game = game else { return 0 }

        switch section {
        case kDescriptionSection: return 1
        case kHighlightsSection: return game.highlights.count
        default: return game.highlights.isEmpty ? 1 : 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let game = game else { return UITableViewCell() }

        switch indexPath.section {
        case kDescriptionSection:
            return tableView.dequeueReusableCell(type: GameDetailDescriptionCell.self, indexPath: indexPath) .. {
                $0.bind(game: game)
            }

        case kHighlightsSection:
            return tableView.dequeueReusableCell(type: GameHighlightCell.self, indexPath: indexPath) .. {
                $0.bind(highlight: game.highlights[indexPath.row])
            }

        default:
            return tableView.dequeueReusableCell(type: EmptyHighlightCell.self, indexPath: indexPath)

        }

    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == kHighlightsSection ? L10n.Details.Section.highlights : nil
    }

}
