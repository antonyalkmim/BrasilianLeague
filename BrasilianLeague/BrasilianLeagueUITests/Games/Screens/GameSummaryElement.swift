//
//  GameSummaryElement.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation
import XCTest

struct GameSummaryElement {

    private struct ElementID {
        static let kTimeAndPlaceLabel = "game_summary_time_place"
        static let kMandatoryScoreLabel = "game_summary_mandatory_score_label"
        static let kVisitorScoreLabel = "game_summary_visitor_score_label"

        static let kMandatoryInitialsLabel = "game_summary_mandatory_initials_label"
        static let kVisitorInitialsLabel = "game_summary_visitor_initials_label"
    }

    let element: XCUIElement
    let timeAndPlaceLabel: XCUIElement

    let mandatoryScoreLabel: XCUIElement
    let visitorScoreLabel: XCUIElement

    let mandatoryInitialsLabel: XCUIElement
    let visitorInitialsLabel: XCUIElement

    init(element: XCUIElement) {
        self.element = element
        timeAndPlaceLabel = element.staticTexts[ElementID.kTimeAndPlaceLabel]

        mandatoryScoreLabel = element.staticTexts[ElementID.kMandatoryScoreLabel]
        visitorScoreLabel = element.staticTexts[ElementID.kVisitorScoreLabel]

        mandatoryInitialsLabel = element.staticTexts[ElementID.kMandatoryInitialsLabel]
        visitorInitialsLabel = element.staticTexts[ElementID.kVisitorInitialsLabel]
    }

}
