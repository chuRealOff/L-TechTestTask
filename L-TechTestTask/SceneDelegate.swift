//
//  SceneDelegate.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 09.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)

		let navigationController = UINavigationController()
		let appCoordinator = AppCoordinator(navigationController: navigationController)

		window.rootViewController = navigationController
		window.makeKeyAndVisible()

		appCoordinator.start()

		self.window = window
	}
}

