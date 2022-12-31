//
//  GameDetailViewModelTests.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
@testable import FeatureGames
import XCTest

class GameDetailsViewModelTests: XCTestCase {

    private var sut: GameDetailsViewModel!

    private var serviceMock: GamesService! {
        didSet {
            sut = GameDetailsViewModel(gameSummary: gameStub, service: serviceMock)
        }
    }

    override func setUp() {
        super.setUp()
        Current = .mock
        serviceMock = .mock()
        sut = GameDetailsViewModel(gameSummary: gameStub, service: serviceMock)
    }

    func test_loadedHighlightsState() async throws {
        let gameDetails = Game.stub(highlights: [.stub()])

        serviceMock.getGameDetails = { _ in gameDetails }
        let state = await sut.loadGameDetails()

        XCTAssertEqual(state, .loaded(gameDetails))
    }

}

extension GameDetailsViewModel.State: Equatable {
    public static func == (
        lhs: GameDetailsViewModel.State,
        rhs: GameDetailsViewModel.State
    ) -> Bool {
        // swiftlint:disable identifier_name
        switch (lhs, rhs) {
        case let (.loaded(l), .loaded(r)): return l == r
        case let (.error(l), .error(r)): return l.localizedDescription == r.localizedDescription
        default: return false
        }
        // swiftlint:enable identifier_name
    }
}

// MARK: - Mocks

private let gameStub = GameSummary.stub(
    mandatoryTeam: .stub(initials: "FLA"),
    visitorTeam: .stub(initials: "FLU"),
    mandatoryTeamGoals: 1,
    visitorTeamGoals: 0
)
