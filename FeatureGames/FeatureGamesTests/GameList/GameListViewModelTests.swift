//
//  GameListViewModelTests.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import XCTest
@testable import FeatureGames

class GameListViewModelTests: XCTestCase {

    private var sut: GameListViewModel!

    private var serviceMock: GamesService! {
        didSet {
            sut = GameListViewModel(service: serviceMock)
        }
    }

    private let brandURL = URL(string: "https://image.url")!

    override func setUp() {
        super.setUp()
        serviceMock = .mock()
        sut = GameListViewModel(service: serviceMock)
    }

    func test_getGames_shouldReturnGames() async throws {
        // given
        let gameStub = GameSummary.stub(
            mandatoryTeam: .stub(name: "Flamengo", initials: "FLA", brandUrl: brandURL),
            visitorTeam: .stub(name: "Fluminense", initials: "FLU", brandUrl: brandURL),
            mandatoryTeamGoals: 1,
            visitorTeamGoals: 0,
            eventDate: Date(day: 20, month: 12, year: 2022) ?? .now
        )
        serviceMock.listGames = { [gameStub] }

        // when
        let loadedGames = try await sut.getGames()

        // then
        let game = try XCTUnwrap(loadedGames.first)

        XCTAssertEqual(loadedGames.count, 1)
        XCTAssertEqual(game.mandatoryTeam.initials, "FLA")
        XCTAssertEqual(game.visitorTeam.initials, "FLU")
        XCTAssertEqual(game.mandatoryTeamGoals, 1)
        XCTAssertEqual(game.visitorTeamGoals, 0)
    }

    func test_selectGame_shouldTriggerDetailsRoute() {
        let coordinatorSpy = GameCoordinatorSpy()
        let sut = GameListViewModel(coordinator: coordinatorSpy)

        // when
        sut.selectGame(.stub())

        // then
        XCTAssertEqual(coordinatorSpy.triggeredRoute, .details)

    }

}
