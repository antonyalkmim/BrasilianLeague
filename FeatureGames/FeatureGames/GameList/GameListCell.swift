//
//  GameListCell.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import Nuke
import TinyConstraints
import UIKit

final class GameListCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var gameSummaryView = GameSummaryView()

    // MARK: - Initializers

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        Nuke.cancelRequest(for: gameSummaryView.mandatoryBrandImageView)
        Nuke.cancelRequest(for: gameSummaryView.visitorBrandImageView)
    }

    // MARK: - Configuration

    private func configure() {
        addSubview(gameSummaryView)
        gameSummaryView.edgesToSuperview()
    }

    func bind(game: GameSummary) {
        gameSummaryView.bind(game)
    }
}
