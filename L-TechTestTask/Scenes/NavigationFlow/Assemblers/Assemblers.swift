//
//  DevExamAssembler.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

protocol IAssembler: AnyObject {
	func assemble() -> UIViewController
}

final class DevExamLoginAuthSceneAssembler: IAssembler {
	/// Проводит сборку DevExamAuth сцены приложения.
	/// - Returns: DevExamAuthorization контроллер.
	func assemble() -> UIViewController {

		return UIViewController()
	}
}

final class DevExamAssembler: IAssembler {
	/// Проводит сборку DevExam  сцены приложения.
	/// - Returns: DevExam контроллер.
	func assemble() -> UIViewController {
		let presenter = DevExamPresenter()
		let worker = DevExamWorker()
		let interactor = DevExamInteractor(presenter: presenter, worker: worker)
		let viewController = DevExamViewController(interactor: interactor)
		presenter.viewController = viewController

		return viewController
	}
}

final class DevExamDetailAssembler: IAssembler {
	/// Проводит сборку DevExamDetail  сцены приложения.
	/// - Returns: DevExamDetail контроллер.
	func assemble() -> UIViewController {
		let presenter = DevExamDetailPresenter()
		let interactor = DevExamDetailInteractor(presenter: presenter)
		let viewController = DevExamDetailViewController(interactor: interactor)
		presenter.viewController = viewController

		return viewController
	}
}
