//
//  GameDetailsController.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Core
import UIKit

final class GameDetailsController: Controller {

    private let viewModel: GameDetailsViewModel

    private lazy var rootView = GameDetailsView()

    init(viewModel: GameDetailsViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        loadSummary()
        loadGameDetails()
    }

    override func loadView() {
        view = rootView
    }

    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }

    private func loadSummary() {
        rootView.setGameSummary(viewModel.gameSummary)
    }

    private func loadGameDetails() {
        Task(priority: .userInitiated) {
            rootView.showLoading(true)
            let state = await viewModel.loadGameDetails()
            rootView.bind(state: state)
        }
    }

}
