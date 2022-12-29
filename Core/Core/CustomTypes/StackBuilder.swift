//
//  StackBuilder.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

import UIKit

@resultBuilder
public enum StackBuilder {
    public static func buildBlock() -> [UIView] { [] }
    public static func buildBlock(_ stack: UIView...) -> [UIView] { stack }
    public static func buildBlock(_ stack: [UIView]...) -> [UIView] { stack.flatMap { $0 } }
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        components.flatMap { $0 }
    }
}

public func VStack(
    alignment: UIStackView.Alignment = .center,
    spacing: CGFloat = 0,
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    UIStackView(arrangedSubviews: content()) .. {
        $0.axis = .vertical
        $0.alignment = alignment
        $0.spacing = spacing
    }
}

public func HStack(
    alignment: UIStackView.Alignment = .center,
    spacing: CGFloat = 0,
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    UIStackView(arrangedSubviews: content()) .. {
        $0.axis = .horizontal
        $0.alignment = alignment
        $0.spacing = spacing
    }
}
