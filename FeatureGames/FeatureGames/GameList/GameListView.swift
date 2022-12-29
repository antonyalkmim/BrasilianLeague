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

    private var items: [GameSummary] = []

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

    func setItems(_ items: [GameSummary]) {
        self.items = items
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension GameListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(type: GameListCell.self, indexPath: indexPath) .. {
            $0.bind(game: items[indexPath.row])
        }
    }
}

// MARK: - UITableViewDelegate

extension GameListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected", indexPath.row)
    }
}
