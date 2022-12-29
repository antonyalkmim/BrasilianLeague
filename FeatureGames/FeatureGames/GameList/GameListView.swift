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

    // MARK: - Subviews

    lazy var tableView = UITableView() .. {
        $0.register(GameListCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.separatorInset = .zero
    }

    // MARK: - View Setup

    override func configureSubviews() {
        addSubview(tableView)

        backgroundColor = .systemBackground
    }

    override func configureConstraints() {
        tableView.edgesToSuperview()
    }
}

// MARK: - UITableViewDataSource

extension GameListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(type: GameListCell.self, indexPath: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension GameListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected", indexPath.row)
    }
}
