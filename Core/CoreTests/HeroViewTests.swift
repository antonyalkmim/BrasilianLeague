//
//  CoreTests.swift
//  CoreTests
//
//  Created by antony.alkmim on 29/12/22.
//

@testable import Core
import SnapshotTesting
import TestSupport
import XCTest

class HeroViewTests: XCTestCase {

    func testShowOfflineError() {
        let view = HeroView()
        view.showError(NetworkError.noInternetConnection)
        assertSnapshot(
            matching: view.embededInView(width: 320, heigth: 700),
            as: .image
        )
    }

    func testGenericError() {
        let view = HeroView()
        view.showError(NetworkError.unknow(nil))
        assertSnapshot(
            matching: view.embededInView(width: 320, heigth: 700),
            as: .image
        )
    }

    func testCustomError() {
        let view = HeroView()
        view.imageView.image = UIImage(systemName: "hand.thumbsup.fill")
        view.titleLabel.text = "My custom error"
        view.messageLabel.text = "My custom error text message"

        assertSnapshot(
            matching: view.embededInView(width: 320, heigth: 700),
            as: .image
        )
    }
}
