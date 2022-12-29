//
//  SceneDelegate.swift
//  BrasilianLeague
//
//  Created by antony.alkmim on 29/12/22.
//

import Core
import FeatureGames
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let gamesCoordinator = GamesCoordinator()
        gamesCoordinator.navigate(to: .list)

        let mainController = UITabBarController()
        mainController.setViewControllers([gamesCoordinator], animated: false)

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

}
