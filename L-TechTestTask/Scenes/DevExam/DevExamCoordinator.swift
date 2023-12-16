//
//  Coordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 12.12.2023.
//
import UIKit

/// Координатор основного экрана.
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
