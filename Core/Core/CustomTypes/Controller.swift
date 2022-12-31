//
//  Controller.swift
//  Core
//
//  Created by antony.alkmim on 29/12/22.
//

import UIKit

open class Controller: UIViewController {

    // MARK: - Init

    public init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        navigationItem.largeTitleDisplayMode = .automatic
        edgesForExtendedLayout = []
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
