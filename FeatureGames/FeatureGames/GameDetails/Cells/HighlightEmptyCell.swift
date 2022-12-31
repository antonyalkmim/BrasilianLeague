//
//  HighlightEmptyCell.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import Nuke
import TinyConstraints
import UIKit

final class EmptyHighlightCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var emptyMessageLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .secondaryLabel
        $0.text = L10n.Details.Empty.message
    }

    private lazy var contentStack = VStack(spacing: .medium) {
        emptyMessageLabel
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

}
