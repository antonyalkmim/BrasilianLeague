//
//  Files+JSON.swift
//  Core
//
//  Created by antony.alkmim on 02/01/23.
//

import Foundation

public enum Files {

    public struct FileNotFoundError: Error {
        let file: String
    }

    public static func getJSON(
        name: String,
        in bundle: Bundle
    ) throws -> Data {
        guard let url = bundle.url(forResource: name, withExtension: ".json") else {
            throw FileNotFoundError(file: "\(name).json")
        }

        return try Data(contentsOf: url)
    }
}
