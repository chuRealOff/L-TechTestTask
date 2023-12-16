//
//  CoordinatorProtocols.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

/// Метод для завершения работы координатора сцены.
protocol ICoordinatorFinishDelegate: AnyObject {
	func didFinish(_ coordinator: ICoordinator )
}

/// Набор базовых свойств и методов координатора.
protocol ICoordinator: AnyObject {
	var navigationController: UINavigationController { get }
	var childCoordinators: [ICoordinator] { get set }
	var finishDelegate: ICoordinatorFinishDelegate? { get set }
	func start()
	func finish()
}

/// Набор методов для реализации главным координатором.
protocol IAppCoordinator: ICoordinator {
	func showLoginSceneFlow()
	func showDevExamSceneFlow()
}

/// Набор методов для реализации координатором экрана авторизации.
protocol IAuthorizationCoordinator: ICoordinator {
	func showLoginSceneFlow()
}

/// Набор методов для реализации координатором основного экрана..
protocol IDevExamCoordinator: ICoordinator {
	func showDevExamSceneFlow()
	func showDevExamDetailSceneFlow()
}
