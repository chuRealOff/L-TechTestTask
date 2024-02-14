//
//  NewsModel.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import UIKit

/// Data Transfer Object. Контейнер для моделей данных.
public enum DTO {
	/// Модель данных для декодирования.
	public struct NewsRawModel: Decodable {
		let id: String
		let title: String
		let text: String
		let image: String
		let sort: Int
		let date: String
	}

	/// Модель данных для использования при отображении данных на главном экране.
	struct News {
		let title: String
		let text: String
		let sort: Int
		let date: String
		let image: UIImage?
	}
}
