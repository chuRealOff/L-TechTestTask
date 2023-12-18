//
//  DevExamAssembler.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 13.12.2023.
//

import UIKit

final class DevExamAssembler {
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
