//
//  GameSummaryViewTests.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

@testable import FeatureGames
import SnapshotTesting
import TestSupport
import XCTest

class GameSummaryViewTests: XCTestCase {

    func testGameSummaryBindData() {

        // given
        let gameSummary = GameSummary.stub(
            visitorTeam: .stub(initials: "GOI"),
            visitorTeamGoals: 2,
            eventDate: Date(day: 30, month: 12, year: 2022) ?? .now
        )

        // when
        let view = GameSummaryView()
        view.bind(gameSummary)

        // then
        assertSnapshot(matching: view.embededInView(width: 320), as: .image)
    }
}
