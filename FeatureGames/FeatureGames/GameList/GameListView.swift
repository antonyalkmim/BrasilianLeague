//
//  GameListView.swift
//  FeatureGames
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import TinyConstraints
import UIKit

final class GameListView: ContainerView {

    // MARK: - Properties

    private let didTapShowDetails: () -> Void

    // MARK: - Subviews

    private lazy var gameTitleLabel = UILabel() .. {
        $0.text = "Flam vs Corinthians"
        $0.textColor = .black
    }

    private lazy var showDetailsButton = UIButton() .. {
        $0.setTitle("Mostrar detalhes", for: .normal)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }

    private lazy var containerStack = UIStackView(
        arrangedSubviews: [
            gameTitleLabel,
            showDetailsButton
        ]
    ) .. {
        $0.axis = .vertical
    }

    // MARK: - Initializers

    init(didTapShowDetails: @escaping () -> Void) {
        self.didTapShowDetails = didTapShowDetails
        super.init()
    }

    // MARK: - View Setup

    override func configureSubviews() {
        addSubview(containerStack)

        backgroundColor = .red
    }

    override func configureConstraints() {
        containerStack.centerInSuperview()
    }

    // MARK: - Actions

    @objc private func showDetails() {
        didTapShowDetails()
    }
}
