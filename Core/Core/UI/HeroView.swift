//
//  HeroView.swift
//  Core
//
//  Created by antony.alkmim on 31/12/22.
//

import TinyConstraints
import UIKit

public class HeroView: ContainerView {

    private lazy var contentStack = VStack(spacing: .large) {
        imageView
        titleLabel
        messageLabel
    }

    public var imageView = UIImageView() .. {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
        $0.width(100)
        $0.height(140)
    }

    public var titleLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .largeTitle)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .darkGray
    }

    public var messageLabel = UILabel() .. {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .lightGray
    }

    public override func configureSubviews() {
        addSubview(contentStack)
        isUserInteractionEnabled = false
    }

    public override func configureConstraints() {
        contentStack.horizontalToSuperview(insets: .uniform(.xLarge))
        contentStack.centerYToSuperview()
    }
}

// MARK: - Show Errors methods

public extension HeroView {
    func showError(_ error: Error) {
        switch error {
        case NetworkError.noInternetConnection, NetworkError.connectionError: showOfflineError()
        default: showGenericError()
        }
    }

    private func showOfflineError() {
        isHidden = false
        imageView.image = UIImage(systemName: "wifi.slash")
        titleLabel.text = L10n.Error.Network.title
        messageLabel.text = L10n.Error.Network.message
    }

    private func showGenericError() {
        isHidden = false
        imageView.image = UIImage(systemName: "slash.circle")
        titleLabel.text = L10n.Error.Generic.title
        messageLabel.text = L10n.Error.Generic.message
    }
}
