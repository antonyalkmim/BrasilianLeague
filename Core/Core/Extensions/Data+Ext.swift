//
//  Data+Ext.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public extension Data {
    func decodeFromAPI<Response: Decodable>(
        _ type: Response.Type = Response.self,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    ) throws -> Response {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom(Self.dateDecoder)
        decoder.keyDecodingStrategy = keyDecodingStrategy
        return try decoder.decode(type, from: self)
    }

    private static func dateDecoder(_ decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        if let date = DateFormatter.ISO8601MilisecondsFormatter.date(from: string) {
            return date
        }

        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unknown date format: \(string)"
            )
        )
    }
}
