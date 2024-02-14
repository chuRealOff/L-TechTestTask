//
//  CoordinatorProtocols.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

/// Делегат, оповещающий о завершении
protocol ICoordinatorFinishDelegate: AnyObject {
	/// Уведомляет о заверешнии работы сцены.
	/// - Parameter coordinator: Координатор завершенной сцены.
	func didFinish(_ coordinator: ICoordinator )
}

/// Набор базовых свойств и методов для всех координаторов.
protocol ICoordinator: AnyObject {
	/// UINavigationController  координатора.
	var navigationController: UINavigationController { get set }
	/// Список дочерних координаторов.
	var childCoordinators: [ICoordinator] { get set }
	/// Делегат, оповещающий о завершении сцены.
	var finishDelegate: ICoordinatorFinishDelegate? { get set }

	/// Создаёт желанную сцену и осуществляет на неё переход.
	func start()

	/// Завершает работу сцены.
	func finish()
}
