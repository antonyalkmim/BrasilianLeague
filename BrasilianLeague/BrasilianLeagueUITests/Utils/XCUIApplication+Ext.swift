//
//  XCUIApplication+Ext.swift
//  BrasilianLeagueUITests
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation
import XCTest

extension XCUIApplication {
    func setLaunchArguments(_ args: [LaunchArgument]) {
        self.launchArguments = args.map { $0.rawValue }
    }
}
