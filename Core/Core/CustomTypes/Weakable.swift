//
//  Weakable.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

// swiftlint:disable identifier_name
import Foundation

public protocol Weakable: AnyObject {}

extension NSObject: Weakable {}

public extension Weakable {
    func weakify(_ code: @escaping (Self) -> Void) -> () -> Void {
        { [weak self] in
            guard let self = self else { return }
            code(self)
        }
    }

    func weakify<A>(_ code: @escaping (Self, A) -> Void) -> (A) -> Void {
        { [weak self] a in
            guard let self = self else { return }
            code(self, a)
        }
    }

    func weakify<A, B>(_ code: @escaping (Self, A, B) -> Void) -> (A, B) -> Void {
        { [weak self] a, b in
            guard let self = self else { return }
            code(self, a, b)
        }
    }

}

// swiftlint:enable identifier_name
