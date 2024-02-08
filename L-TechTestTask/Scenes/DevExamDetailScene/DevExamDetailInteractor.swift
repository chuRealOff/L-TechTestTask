//
//  DevExamDetailInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation

protocol IDevExamDetailInteractor: AnyObject {
	/// Функция сообщает о готовности представления к отображению данных.
	func viewIsReady()
}

final class DevExamDetailInteractor {
	// MARK: - Dependencies
	private let presenter: IDevExamDetailPresenter
	private let newsData: [DTO.News]
	private let indexPath: IndexPath

	// MARK: - Initializer
	init(presenter: IDevExamDetailPresenter, newsData: [DTO.News], indexPath: IndexPath) {
		self.presenter = presenter
		self.newsData = newsData
		self.indexPath = indexPath
	}
}

// MARK: - IDevExamDetailInteractor Implementation
extension DevExamDetailInteractor: IDevExamDetailInteractor {
	func viewIsReady() {
		let screenData = newsData[indexPath.row]
		presenter.present(with: screenData)
	}
}
