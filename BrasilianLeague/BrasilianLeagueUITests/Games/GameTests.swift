//
//  GamesTests.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import XCTest

class GameListTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
    }

    func test_listGames_andNavigateToDetails() throws {
        app.setLaunchArguments([.uiTest, .useMockHttpRequests])
        app.launch()

        let screen = GameListScreen()

        // 1 - open game list

        XCTAssertTrue(screen.gamesTableView.exists)
        XCTAssertEqual(screen.gamesTableView.cells.count, 3)

        let firstCell = screen.firstCell()
        XCTAssertEqual(firstCell.timeAndPlaceLabel.label, "11 DE DEZ. DE 2022 MARACANÃ 16:00")
        XCTAssertEqual(firstCell.mandatoryScoreLabel.label, "1")
        XCTAssertEqual(firstCell.visitorScoreLabel.label, "2")

        XCTAssertEqual(firstCell.mandatoryInitialsLabel.label, "VAS")
        XCTAssertEqual(firstCell.visitorInitialsLabel.label, "AVA")

        // 2 - navigate to game details
        firstCell.element.tap()

        let detailsScreen = GameDetailsScreen()

        XCTAssertTrue(detailsScreen.gameSummaryView.exists)
        XCTAssertEqual(
            detailsScreen.titleLabel.label,
            "Avaí se despede da Série A com vitória sobre o Flamengo"
        )
        XCTAssertEqual(
            detailsScreen.descriptionLabel.label,
            "Na última rodada do Brasileiro, Avaí vence o Flamengo por 2 a 1"
        )

    }

    func test_loadGameListWithError() throws {
        app.setLaunchArguments([.uiTest, .useMockErrorHttpRequests])
        app.launch()

        let screen = GameListScreen()

        XCTAssertEqual(screen.gamesTableView.cells.count, 0)

        XCTAssertTrue(screen.errorView.exists)
        XCTAssertTrue(screen.errorViewElement().imageView.exists)
        XCTAssertEqual(screen.errorViewElement().titleLabel.label, "Algo de errado por aqui")

        // swiftlint:disable line_length
        XCTAssertEqual(
            screen.errorViewElement().messageLabel.label,
            "Aconteceu um error e já estamos trabalhando para tudo voltar ao normal. Tente acessar novamente mais tarde!"
        )
        // swiftlint:enable line_length
    }
}
