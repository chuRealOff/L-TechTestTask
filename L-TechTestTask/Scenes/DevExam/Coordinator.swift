//
//  Coordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 12.12.2023.
//
import UIKit

protocol ICoordinatorFinishDelegate {
	func didFinish(_ coordinator: ICoordinator )
}
protocol ICoordinator: AnyObject {
	var navigationController: UINavigationController { get }
	var childCoordinators: [ICoordinator] { get set }
	var finishDelegate: ICoordinatorFinishDelegate? { get set }
	func start()
	func finish()
}

extension ICoordinator {
	func finish() {
		childCoordinators.removeAll()
		finishDelegate?.didFinish(self)
	}
}

protocol IAppCoordinator: ICoordinator {
	func showLoginSceneFlow()
	func showDevExamSceneFlow()
}

protocol IAuthorizationCoordinator: ICoordinator {
	func showLoginSceneFlow()
}

protocol IDevExamCoordinator: ICoordinator {
	func showDevExamSceneFlow()
	func showDevExamDetailSceneFlow()
}

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

final class DevExamCoordinator: IDevExamCoordinator {
	
	var navigationController: UINavigationController

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		showDevExamSceneFlow()
	}

	func showDevExamSceneFlow() {
		let devExamController = DevExamAssembler().assemble()
		navigationController.pushViewController(devExamController, animated: true)
	}

	func showDevExamDetailSceneFlow() {
		//
	}
}
