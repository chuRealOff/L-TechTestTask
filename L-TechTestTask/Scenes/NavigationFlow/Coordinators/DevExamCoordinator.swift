//
//  Coordinator.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 12.12.2023.
//
import UIKit

/// Набор методов для реализации координатором основного экрана..
protocol IDevExamCoordinator: ICoordinator {
	/// Проводит сборку  и отображение основого экрана приложения.
	func showDevExamSceneFlow()

	/// Проводит сборку и отображение экрана с детальной информацией.
	/// - Parameters:
	///   - newsData: Данные для отображения на экране.
	///   - indexPath: Индекс выбранного для отображения события.
	func showDevExamDetailSceneFlow(with newsData: [DTO.News], at indexPath: IndexPath)

	/// Создаёт и отображает на экране UIAlertController, ответственный за обработку ошибок сетевых запросов.
	/// - Parameter message: текст сообщения об ошибке.
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

	func showAlertController(with message: String) {
		let alertController = UIAlertController(
			title: "An error hac occured!",
			message: message,
			preferredStyle: .alert
		)
		navigationController.present(alertController, animated: true)
	}
}
