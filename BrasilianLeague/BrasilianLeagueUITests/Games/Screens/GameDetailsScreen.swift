//
//  GameDetailsScreen.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation
import XCTest

struct GameDetailsScreen {

    private struct ElementID {
        static let kSummaryView = "game_details_summary_view"

        static let kTitleLabel = "game_details_title"
        static let kDescriptionLabel = "game_details_description"

    }

    let gameSummaryView: XCUIElement
    let titleLabel: XCUIElement
    let descriptionLabel: XCUIElement

    init() {
        let app = XCUIApplication()
        gameSummaryView = app.otherElements[ElementID.kSummaryView]
        titleLabel = app.staticTexts[ElementID.kTitleLabel]
        descriptionLabel = app.staticTexts[ElementID.kDescriptionLabel]
    }

}
