//
//  UIView+ext.swift
//  FeatureGamesTests
//
//  Created by antony.alkmim on 30/12/22.
//

import UIKit

extension UIView {

    public func embededInView(
        width: CGFloat? = nil,
        heigth: CGFloat? = nil,
        insets: UIEdgeInsets = .zero,
        backgroundColor: UIColor = .white
    ) -> UIView {
        let parentView = UIView()
        parentView.backgroundColor = backgroundColor
        parentView.addSubview(self)

        translatesAutoresizingMaskIntoConstraints = false
        parentView.translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let heigth = heigth {
            heightAnchor.constraint(equalToConstant: heigth).isActive = true
        }

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -insets.bottom),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -insets.right)
        ])

        return parentView
    }
}
