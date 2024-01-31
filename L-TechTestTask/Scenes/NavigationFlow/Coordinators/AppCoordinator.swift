//
//  MainCoordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

/// Старший координатор приложения, содержащий в себе все дочерние.
final class AppCoordinator: IAppCoordinator {
	var navigationController: UINavigationController

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		showDevExamSceneFlow() // изменить на логин сцену
	}

	func showLoginSceneFlow() {
		let authorizationCoordinator = AuthorizationCoordinator(navigationController: navigationController)
		childCoordinators.append(authorizationCoordinator)
		authorizationCoordinator.start()
	}

	func showDevExamSceneFlow() {
		let devExamCoordinator = DevExamCoordinator(navigationController: navigationController)
		childCoordinators.append(devExamCoordinator)
		devExamCoordinator.start()
	}
}
