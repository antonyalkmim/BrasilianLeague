//
//  Current.swift
//  BrasilianLeague
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation
import Core
import os.log

extension AppDelegate {
    func setupWorld() {
        Current = World(
            apiClient: {
                HttpService {
                    os_log("➡️ %@ %@", type: .debug, $0.method.rawValue.uppercased(), $0.path)
                    return $0.urlRequest()
                } responseClosure: { response, _ in
                    guard let response = response else { return }
                    os_log("✅ %@ [%@] ", type: .debug, String(response.statusCode), response.url?.absoluteString ?? "")
                }
            }
        )
    }
}
