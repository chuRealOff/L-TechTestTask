//
//  DevExamPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import UIKit

protocol IDevExamPresenter {
	/// Сообщает презентеру данные, необходимые для передачи контроллеру..
	/// - Parameter newsData: массив данных для отображения на экране контроллера.
	func present(with newsData: [DTO.NewsRawModel], and images: [UIImageView])
}

final class DevExamPresenter: IDevExamPresenter {
	// MARK: - Parameters
	weak var viewController: IDevExamViewController?

	// MARK: - Protocol Implementation
	func present(with newsData: [DTO.NewsRawModel], and images: [UIImageView]) {
		var news = [DTO.News]()
		viewController?.viewRender(with: news)
	}
}
