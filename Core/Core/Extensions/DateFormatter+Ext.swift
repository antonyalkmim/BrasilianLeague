//
//  DateFormatter+Ext.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public extension DateFormatter {
    static let ISO8601MilisecondsFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
}
