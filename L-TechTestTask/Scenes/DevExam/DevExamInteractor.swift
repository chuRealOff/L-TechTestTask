//
//  DevExamInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation

protocol IDevExamInteractor {
	/// Функция сообщает о готовности представления к отображению данных.
	func viewIsReady()

	/// Отрабатывает нажатие на ячейку контроллера.
	/// - Parameter indexPath: индекс ячейки.
	func rowDidSelect(atIndexPath indexPath: IndexPath)
}

final class DevExamInteractor {
	// MARK: - Parameters
	private let presenter: IDevExamPresenter
	private let worker: IDevExamWorker

	// MARK: - Initializer
	init(presenter: IDevExamPresenter, worker: IDevExamWorker) {
		self.presenter = presenter
		self.worker = worker
	}
}

// MARK: - IDevExamInteractor Implementation
extension DevExamInteractor: IDevExamInteractor {
	func viewIsReady() {
		worker.fetchNetworkData(
			from: Constants.urlString) { news in
				self.presenter.present(with: news)
			}
	}

	func rowDidSelect(atIndexPath indexPath: IndexPath) {

	}
}
