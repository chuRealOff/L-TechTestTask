//
//  NewsModel.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import UIKit

/// Data Transfer Object. Контейнер для моделей данных.
enum DTO {
	/// Модель данных для декодирования.
	struct NewsRawModel: Decodable {
		let id: String
		let title: String
		let text: String
		let imageRelativePath: String
		let sort: Int
		let date: String
	}

	/// Модель данных для использования при отображении данных на главном экране.
	struct News {
		let title: String
		let text: String
		let sort: Int
		let date: Date
		let images: [UIImage]
	}
}
