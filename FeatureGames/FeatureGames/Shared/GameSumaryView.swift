//
//  GameSumaryView.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import Nuke
import TinyConstraints
import UIKit

final class GameSummaryView: ContainerView {

    // MARK: - Subviews

    private lazy var contentStack = VStack(spacing: .small) {
        timeAndPlaceLabel
        HStack(spacing: .medium) {
            mandatoryTeamStack
            scoreStack
            visitorTeamStack
        }
    }

    lazy var timeAndPlaceLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .caption1)
        $0.text = "SÁB 12/12/1212 MARACANÃ 16:00"
    }

    // MARK: - Scoreboard views

    private lazy var scoreStack = HStack(spacing: .small) {
        mandatoryScoreLabel
        UILabel() .. {
            $0.text = "x"
            $0.textColor = .lightGray
        }
        visitorScoreLabel
    }

    lazy var mandatoryScoreLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "0"
    }

    lazy var visitorScoreLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.text = "0"
    }

    // MARK: - First Team Views

    private lazy var mandatoryTeamStack = HStack(spacing: .small) {
        mandatoryInitialsLabel
        mandatoryBrandImageView
    }

    lazy var mandatoryInitialsLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title2)
        $0.text = "ABC"
    }

    lazy var mandatoryBrandImageView = UIImageView() .. {
        $0.contentMode = .scaleAspectFit
        $0.height(40)
        $0.width(40)
    }

    // MARK: - Second Team Views

    private lazy var visitorTeamStack = HStack(spacing: .small) {
        visitorBrandImageView
        visitorInitialsLabel
    }

    lazy var visitorInitialsLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .title2)
        $0.text = "ABC"
    }

    lazy var visitorBrandImageView = UIImageView() .. {
        $0.contentMode = .scaleAspectFit
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

    func bind(_ game: GameSummary) {

        let dateString = game.eventDate.formatted(date: .abbreviated, time: .omitted)
        let timeString = game.eventDate.formatted(date: .omitted, time: .shortened)
        timeAndPlaceLabel.text = "\(dateString) \(game.stadiumName) \(timeString)".uppercased()

        // mandatory data
        mandatoryInitialsLabel.text = game.mandatoryTeam.initials
        mandatoryScoreLabel.text = String(game.mandatoryTeamGoals)
        Nuke.loadImage(with: game.mandatoryTeam.brandUrl, into: mandatoryBrandImageView)

        // visitor data
        visitorInitialsLabel.text = game.visitorTeam.initials
        visitorScoreLabel.text = String(game.visitorTeamGoals)
        Nuke.loadImage(with: game.visitorTeam.brandUrl, into: visitorBrandImageView)
    }
}
