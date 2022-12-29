//
//  NavigationController.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

import UIKit

open class NavigationController: UINavigationController {

    // MARK: - Init

    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    public convenience init(rootController: Controller) {
        self.init()
        viewControllers = [rootController]
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        navigationBar.prefersLargeTitles = true
        navigationBar.isTranslucent = true
        navigationBar.barStyle = .default
        navigationBar.tintColor = .white

        let navBarAppearance = UINavigationBarAppearance()
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
