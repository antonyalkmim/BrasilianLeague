//
//  Team.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation

struct Team: Decodable, Equatable {
    let name: String
    let initials: String
    let brandUrl: URL
}
