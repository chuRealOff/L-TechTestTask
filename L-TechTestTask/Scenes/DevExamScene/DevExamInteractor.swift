//
//  DevExamInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation
import UIKit

protocol IDevExamInteractor: AnyObject {
	/// Функция сообщает о готовности представления к отображению данных.
	func viewIsReady()

	/// Отрабатывает нажатие на ячейку контроллера.
	/// - Parameter indexPath: индекс ячейки.
	func rowDidSelect(atIndexPath indexPath: IndexPath)
}

final class DevExamInteractor {
	// MARK: - Dependencies
	private let presenter: IDevExamPresenter
	private let worker: IDevExamWorker
	private let coordinator: IDevExamCoordinator

	// MARK: - Initializer
	init(presenter: IDevExamPresenter, worker: IDevExamWorker, coordinator: IDevExamCoordinator) {
		self.presenter = presenter
		self.worker = worker
		self.coordinator = coordinator
	}
}

// MARK: - IDevExamInteractor Implementation
extension DevExamInteractor: IDevExamInteractor {
	func viewIsReady() {
		worker.fetchNetworkData(from: Constants.jsonURLString) { [ weak self] result in
			switch result {
			case let .success((news, imageViews)):
				self?.presenter.present(with: news, and: imageViews)
			case .failure(let error):
				if let alertController = self?.worker.createAlertController() {
					DispatchQueue.main.async {
						self?.presenter.presentErrorAlert(alertController, withMessage: error.rawValue)
					}
				}
			}
		}
	}

	func rowDidSelect(atIndexPath indexPath: IndexPath) {
		coordinator.showDevExamDetailSceneFlow()
	}
}
