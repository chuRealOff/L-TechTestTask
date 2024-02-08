//
//  DevExamDetailPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation

protocol IDevExamDetailPresenter: AnyObject {
	/// Производит передачу данных в контроллер для их последующего отображения.
	func present(with data: DTO.News)
}

final class DevExamDetailPresenter {
	// MARK: - Dependencies
	weak var viewController: IDevExamDetailViewController?
}

// MARK: - IDevExamDetailPresenter Implementation
extension DevExamDetailPresenter: IDevExamDetailPresenter {
	func present(with data: DTO.News) {
		viewController?.render(with: data)
	}
}
