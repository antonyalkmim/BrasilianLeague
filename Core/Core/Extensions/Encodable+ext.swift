//
//  Encodable+ext.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public extension Encodable {
    func encodeToAPI(
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase
    ) -> Data {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = keyEncodingStrategy

        if let data = try? encoder.encode(self) {
            return data
        }

        return Data()
    }
}
