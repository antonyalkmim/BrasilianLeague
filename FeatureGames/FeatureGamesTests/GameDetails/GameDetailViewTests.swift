//
//  GameDetailViewTests.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 31/12/22.
//

@testable import FeatureGames
import SnapshotTesting
import TestSupport
import XCTest

class GameDetailViewTests: XCTestCase {

    func testEmptyHighlightState() {
        let game = Game.stub(title: loremIpsumTitle, description: loremIpsumDescription)
        let view = GameDetailsView()
        view.bind(state: .loaded(game))

        assertSnapshot(matching: view.embededInView(width: 320, heigth: 700), as: .image)
    }

    func testLoadedHighlightState() {
        let game = Game.stub(
            title: loremIpsumTitle,
            description: loremIpsumDescription,
            highlights: [
                .stub(description: "Gol", eventMinute: 121, type: .goal),
                .stub(description: "Bola na trave", eventMinute: 98, type: .normal)
            ]
        )

        let view = GameDetailsView()
        view.bind(state: .loaded(game))

        assertSnapshot(matching: view.embededInView(width: 320, heigth: 700), as: .image)
    }
}

// swiftlint:disable line_length
private let loremIpsumTitle = "Lorem ipsum dolor sit amet"

private let loremIpsumDescription = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
"""
// swiftlint:enable line_length
