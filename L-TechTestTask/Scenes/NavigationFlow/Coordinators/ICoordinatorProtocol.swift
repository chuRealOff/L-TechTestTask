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
	var navigationController: UINavigationController { get set }
	var childCoordinators: [ICoordinator] { get set }
	var finishDelegate: ICoordinatorFinishDelegate? { get set }
	func start()
	func finish()
}
