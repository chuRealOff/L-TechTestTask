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
