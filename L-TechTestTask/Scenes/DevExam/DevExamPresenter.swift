//
//  DevExamPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import UIKit

protocol IDevExamPresenter {
	/// Сообщает презентеру данные, необходимые для передачи контроллеру..
	/// - Parameter newsData: Массив данных для отображения на экране контроллера.
	func present(with newsData: [DTO.NewsRawModel], and pictures: [UIImageView])
}

final class DevExamPresenter: IDevExamPresenter {
	// MARK: - Dependencies
	weak var viewController: IDevExamViewController?

	// MARK: - Protocol Implementation
	func present(with newsData: [DTO.NewsRawModel], and pictures: [UIImageView]) {
		let news = prepareDataModel(from: newsData, andFillItWith: pictures)
		viewController?.render(with: news)
	}

	/// Готовит данные для представления главному контроллеру.
	/// - Parameters:
	///   - newsData: Данные, полученные из сети.
	///   - imageViews: Изображения, полученные из сети.
	/// - Returns: Массив данных, готовый для работы с пользовательским интерфейсом.
	private func prepareDataModel(
		from newsData: [DTO.NewsRawModel],
		andFillItWith imageViews: [UIImageView]
	) -> [DTO.News] {
		var news = [DTO.News]()

		guard newsData.count == imageViews.count else {
			fatalError("Counts of newsData and imageViews should be equal")
		}

		for (index, particularData) in newsData.enumerated() {

			let image = imageViews[index].image

			let story = DTO.News(
				title: particularData.title,
				text: particularData.text,
				sort: particularData.sort,
				date: self.date(dateString: particularData.date),
				image: image
			)
			news.append(story)

		}

		return news
	}

	/// Преобразует строковую дату, полученную из сети в нужный нам формат.
	private func date(dateString: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

		if let date = dateFormatter.date(from: dateString) {
			dateFormatter.dateFormat = "dd MMMM, HH:mm"
			let formattedDate = dateFormatter.string(from: date)

			return formattedDate
		} else {
			return "Ошибка при преобразовании строки в объект Date"
		}
	}
}
