//
//  Coordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 12.12.2023.
//
import UIKit

/// Набор методов для реализации координатором основного экрана..
protocol IDevExamCoordinator: ICoordinator {
	func showDevExamSceneFlow()
	func showDevExamDetailSceneFlow(with newsData: [DTO.News], at indexPath: IndexPath)
	func showAlertController(with message: String)
}

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
		let devExamController = Assembler.assembleDevExamScene(withCoordinator: self)
		navigationController.pushViewController(devExamController, animated: true)
	}

	func showDevExamDetailSceneFlow(with newsData: [DTO.News], at indexPath: IndexPath) {
		let devExamDetailController = Assembler.assembleDevExamDetailScene(with: newsData, at: indexPath)
		navigationController.pushViewController(devExamDetailController, animated: true)
	}

	/// Создаёт и отображает на экране UIAlertController, ответственный за обработку ошибок сетевых запросов.
	/// - Parameter message: текст сообщения об ошибке.
	func showAlertController(with message: String) {
		let alertController = UIAlertController(
			title: "An error hac occured!",
			message: message,
			preferredStyle: .alert
		)
		navigationController.present(alertController, animated: true)
	}
}
