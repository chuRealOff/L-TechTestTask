//
//  DevExamPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation

protocol IDevExamPresenter {
	/// Сообщает презентеру, что нужно отобразить.
	/// - Parameter newsData: массив данных для отображения на экране контроллера.
	func present(with newsData: [NewsModel])
}

final class DevExamPresenter: IDevExamPresenter {
	// MARK: - Parameters
	weak var viewController: IDevExamViewController?

	// MARK: - Protocol Implementation
	func present(with newsData: [NewsModel]) {
		viewController?.viewRender(with: newsData)
	}
}
