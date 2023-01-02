//
//  GameListScreen.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation
import XCTest

struct GameListScreen {

    private struct ElementID {
        static let kGamesTableView = "games_table_view"
        static let kErrorView = "error_view"
    }

    let gamesTableView: XCUIElement
    let errorView: XCUIElement

    init() {
        let app = XCUIApplication()
        gamesTableView = app.tables[ElementID.kGamesTableView]
        errorView = app.otherElements[ElementID.kErrorView]
    }

    func errorViewElement() -> ErrorViewElement {
        ErrorViewElement(element: errorView)
    }

    func firstCell() -> GameSummaryElement {
        GameSummaryElement(element: gamesTableView.cells.firstMatch)
    }
}

// MARK: - ErrorViewElement

struct ErrorViewElement {

    private struct ElementID {
        static let kImageView = "error_view_image"
        static let kTitle = "error_view_title"
        static let kMessage = "error_view_message"
    }

    let element: XCUIElement
    let imageView: XCUIElement
    let titleLabel: XCUIElement
    let messageLabel: XCUIElement

    init(element: XCUIElement) {
        self.element = element
        imageView = element.images[ElementID.kImageView]
        titleLabel = element.staticTexts[ElementID.kTitle]
        messageLabel = element.staticTexts[ElementID.kMessage]
    }

}
