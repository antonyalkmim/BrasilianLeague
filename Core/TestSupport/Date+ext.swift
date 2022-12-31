//
//  Date+ext.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public extension Date {
    init?(
        day: Int,
        month: Int,
        year: Int,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0,
        timeZone: TimeZone? = nil,
        calendar: Calendar = .current
    ) {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        components.timeZone = timeZone

        guard let interval = calendar.date(from: components)?.timeIntervalSinceReferenceDate else {
            return nil
        }

        self = Date(timeIntervalSinceReferenceDate: interval)
    }
}
