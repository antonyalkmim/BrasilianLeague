//
//  Coordinator.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

import UIKit

public protocol Route { }
public protocol CoordinatorResult {}

open class Coordinator<RouteType: Route, ResultType: CoordinatorResult>: UIViewController {

    public typealias DidFinishCallback = (ResultType) -> Void

    public var didFinish: ((ResultType) -> Void)?
    public var didDismiss: (() -> Void)?

    public init(rootViewController: UIViewController, _ didFinish: DidFinishCallback? = nil) {
        self.didFinish = didFinish
        super.init(nibName: nil, bundle: nil)
        setRoot(rootViewController)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func setRoot(_ controller: UIViewController) {
        if let currentController = children.last {
            currentController.view.removeFromSuperview()
            currentController.removeFromParent()
        }

        addChild(controller)
        view.addSubview(controller.view)
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        controller.didMove(toParent: self)
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            didDismiss?()
            didDismiss = nil
        }
    }

    open func navigate(to route: RouteType) { }
}
