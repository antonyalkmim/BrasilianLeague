//
//  GameListViewModelTests.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import Core
@testable import FeatureGames
import XCTest

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
        Current = .mock
        serviceMock = .mock()
        sut = GameListViewModel(service: serviceMock)
    }

    func test_getGames_shouldReturnLoadedState() async throws {
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
        let state = await sut.getGames()

        // then
        XCTAssertEqual(state, .loaded([gameStub]))
    }

    func test_givenEmptyList_whenGetGames_shouldReturnEmptyState() async {
        serviceMock.listGames = { [] }
        let state = await sut.getGames()
        XCTAssertEqual(state, .empty)
    }

    func test_givenNetworkError_whenGetGames_shouldReturnErrorState() async {
        serviceMock.listGames = { throw NetworkError.noInternetConnection }
        let state = await sut.getGames()
        XCTAssertEqual(state, .error(NetworkError.noInternetConnection))
    }

    func test_selectGame_shouldTriggerDetailsRoute() {
        let summary = GameSummary.stub()
        let coordinatorSpy = GameCoordinatorSpy()
        let sut = GameListViewModel(coordinator: coordinatorSpy)

        // when
        sut.selectGame(summary)

        // then
        XCTAssertEqual(coordinatorSpy.triggeredRoute, .details(summary))

    }

}

extension GameListViewModel.State: Equatable {
    public static func == (
        lhs: FeatureGames.GameListViewModel.State,
        rhs: FeatureGames.GameListViewModel.State
    ) -> Bool {
        // swiftlint:disable identifier_name
        switch (lhs, rhs) {
        case let (.loaded(l), .loaded(r)): return l == r
        case (.empty, .empty): return true
        case let (.error(l), .error(r)): return l.localizedDescription == r.localizedDescription
        default: return false
        }
        // swiftlint:enable identifier_name
    }
}
