//
//  XCUIElement+Helpers.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import XCTest

extension XCTestCase {

    public func waitForElementToNotExist(element: XCUIElement, timeout: TimeInterval? = nil) {
        let notExistsPredicate = NSPredicate(format: "exists == false")
        let expectation = XCTNSPredicateExpectation(
            predicate: notExistsPredicate,
            object: element
        )

        let timeoutValue = timeout ?? 30
        guard XCTWaiter().wait(for: [expectation], timeout: timeoutValue) == .completed else {
            XCTFail("\(element) still exists after \(timeoutValue) seconds.")
            return
        }
    }
}
