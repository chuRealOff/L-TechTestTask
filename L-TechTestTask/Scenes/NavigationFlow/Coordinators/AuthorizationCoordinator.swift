//
//  AuthorizationCoordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

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
