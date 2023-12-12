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
	func showAuthorizationSceneFlow()
	func showDevExamSceneFlow()
}

final class AppCoordinator: IAppCoordinator {
	var navigationController: UINavigationController
	
	var childCoordinators: [ICoordinator]

	var finishDelegate: ICoordinatorFinishDelegate?

	init(navigationController: UINavigationController, childCoordinators: [ICoordinator]) {
		self.navigationController = navigationController
		self.childCoordinators = childCoordinators
	}

	func start() {
		//
	}
	
	func showAuthorizationSceneFlow() {
		//
	}

	func showDevExamSceneFlow() {
		//
	}
}

protocol IDevExamSceneCoordinator {
	func showDevExamDetailSceneFlow()
}
