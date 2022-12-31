//
//  GameHighlighCell.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import Nuke
import TinyConstraints
import UIKit

final class GameHighlightCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var eventTimeLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .largeTitle)
        $0.numberOfLines = 1
        $0.textAlignment = .left
    }

    private lazy var eventDescriptionLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }

    private lazy var contentStack = VStack(alignment: .leading, spacing: .medium) {
        eventTimeLabel
        eventDescriptionLabel
    }

    private lazy var contentStackWrapper = UIView() .. {
        $0.addSubview(contentStack)
        contentStack.edgesToSuperview(insets: .uniform(.medium))

        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        $0.layer.borderWidth = 1
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

        addSubview(contentStackWrapper)
        contentStackWrapper.edgesToSuperview(insets: .horizontal(.xLarge) + .vertical(.small))
    }

    func bind(highlight: GameHighlight) {
        eventDescriptionLabel.text = highlight.description

        let isGoalEvent = highlight.type == .goal
        eventTimeLabel.text = isGoalEvent
            ? L10n.Details.goalEventTime(highlight.eventMinute)
            : L10n.Details.eventTime(highlight.eventMinute)
    }
}
