//
//  DevExamAssembler.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

/// Сборщик сцен приложения.
enum Assembler {
	/// Проводит сборку DevExamAuth сцены приложения.
	/// - Returns: DevExamAuthorization контроллер.
	static func assembleDevExamLoginAuthScene(withCoordinator coordinator: IAuthorizationCoordinator) -> UIViewController {

		return UIViewController()
	}

	/// Проводит сборку DevExam  сцены приложения.
	/// - Returns: DevExam контроллер.
	static func assembleDevExamScene(withCoordinator coordinator: IDevExamCoordinator) -> UIViewController {
		let presenter = DevExamPresenter()
		let worker = DevExamWorker()
		let interactor = DevExamInteractor(presenter: presenter, worker: worker, coordinator: coordinator)
		let viewController = DevExamViewController(interactor: interactor)
		presenter.viewController = viewController

		return viewController
	}

	/// Проводит сборку DevExamDetail  сцены приложения.
	/// - Returns: DevExamDetail контроллер.
	static func assembleDevExamDetailScene(with data: [DTO.News], at indexPath: IndexPath) -> UIViewController {
		let presenter = DevExamDetailPresenter()
		let interactor = DevExamDetailInteractor(presenter: presenter, newsData: data, indexPath: indexPath)
		let viewController = DevExamDetailViewController(interactor: interactor)
		presenter.viewController = viewController

		return viewController
	}
}
