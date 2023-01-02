//
//  BrasilianLeagueUITests.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 29/12/22.
//

import XCTest

final class BrasilianLeagueUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
