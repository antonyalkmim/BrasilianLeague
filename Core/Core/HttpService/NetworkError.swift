//
//  NetworkError.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

enum NetworkError: LocalizedError {
    case unknow(Error?)
    case jsonMapping(Error?)
    case connectionError
    case noInternetConnection
    case statusCodeError(Int)
}
