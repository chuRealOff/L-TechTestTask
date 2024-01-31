//
//  AuthorizationCoordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

/// Набор методов для реализации координатором экрана авторизации.
protocol IAuthorizationCoordinator: ICoordinator {
	func showLoginSceneFlow()
}

/// Координатор экрана авторизации.
final class AuthorizationCoordinator: IAuthorizationCoordinator {

	var navigationController: UINavigationController

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		showLoginSceneFlow()
	}

	func showLoginSceneFlow() {
		//
	}
}
