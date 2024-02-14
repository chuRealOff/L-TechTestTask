//
//  MockDataCreator.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 14.02.2024.
//

import Foundation
import UIKit
import L_TechTestTask

final class MockDataCreator: Mockable {
	/// Производит подготовку моковых данных.
	/// - Returns: Кортеж массивов с моделями и картинками.
	func createMockData() -> ([DTO.NewsRawModel], [UIImageView]) {
		let newsData = loadData(fileName: "newsMockData", type: DTO.NewsRawModel.self)
		let forestImageView = UIImageView.init(image: UIImage(named: "forest"))
		let fieldImageView = UIImageView.init(image: UIImage(named: "field"))
		let imageViews = [forestImageView, fieldImageView]

		return (newsData, imageViews)
	}
}
