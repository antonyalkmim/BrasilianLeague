//
//  GameDetailDescriptionCell.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import Nuke
import TinyConstraints
import UIKit

final class GameDetailDescriptionCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var gameTitleLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .label
    }

    private lazy var gameDescriptionLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 0
        $0.textAlignment = .justified
        $0.textColor = .secondaryLabel
    }

    private lazy var contentStack = VStack(spacing: .large) {
        gameTitleLabel
        gameDescriptionLabel
    }

    // MARK: - Initializers

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration

    private func configure() {

        selectionStyle = .none
        accessoryType = .none

        addSubview(contentStack)
        contentStack.edgesToSuperview(insets: .uniform(.xLarge))
    }

    func bind(game: Game) {
        gameTitleLabel.text = game.title
        gameDescriptionLabel.text = game.description
    }
}
