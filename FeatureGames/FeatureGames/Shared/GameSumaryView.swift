//
//  GameSumaryView.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import TinyConstraints
import UIKit

final class GameSummaryView: ContainerView {

    // MARK: - Subviews

    private lazy var contentStack = VStack(spacing: .small) {
        timeLabel
        HStack(spacing: .medium) {
            firstTeamStack
            scoreStack
            secondTeamStack
        }
    }

    private lazy var timeLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .caption1)
        $0.text = "SÁB 12/12/1212 MARACANÃ 16:00"
    }

    // MARK: - Scoreboard views

    private lazy var scoreStack = HStack(spacing: .small) {
        firstTeamScoreLabel
        UILabel() .. {
            $0.text = "x"
            $0.textColor = .lightGray
        }
        secondTeamScoreLabel
    }

    private lazy var firstTeamScoreLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "1"
    }

    private lazy var secondTeamScoreLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "2"
    }

    // MARK: - First Team Views

    private lazy var firstTeamStack = HStack(spacing: .small) {
        firstTeamInitialsLabel
        firstTeamBrandImageView
    }

    private lazy var firstTeamInitialsLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "FLA"
    }

    private lazy var firstTeamBrandImageView = UIImageView() .. {
        $0.backgroundColor = .systemGray
        $0.height(40)
        $0.width(40)
    }

    // MARK: - Second Team Views

    private lazy var secondTeamStack = HStack(spacing: .small) {
        secondTeamBrandImageView
        secondTeamInitialsLabel
    }

    private lazy var secondTeamInitialsLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "AVA"
    }

    private lazy var secondTeamBrandImageView = UIImageView() .. {
        $0.backgroundColor = .systemGray
        $0.height(40)
        $0.width(40)
    }

    // MARK: - View Setup

    override func configureSubviews() {
        addSubview(contentStack)
    }

    override func configureConstraints() {
        contentStack.edgesToSuperview(insets: .uniform(.medium))
    }
}
