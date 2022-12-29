//
//  ContainerView.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

import Foundation
import UIKit

open class ContainerView: UIView {

    // MARK: - Init

    public init() {
        super.init(frame: .zero)
        configure()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func configure() {
        configureSubviews()
        configureConstraints()
    }

    open func configureSubviews() {}
    open func configureConstraints() {}
}
