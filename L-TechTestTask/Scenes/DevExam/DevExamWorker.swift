//
//  DevExamWorker.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 11.12.2023.
//

import Foundation
import Kingfisher
import UIKit

protocol IDevExamWorker {
	/// Загружает данные из сети.
	/// - Parameter endPoint: URL адрес страницы.
	func fetchNetworkData(from endPoint: String, completion: @escaping ([DTO.NewsRawModel], [UIImageView]) -> Void)
}

final class DevExamWorker: IDevExamWorker {
	func fetchNetworkData(from endPoint: String, completion: @escaping ([DTO.NewsRawModel], [UIImageView]) -> Void) {
		guard let url = URL(string: endPoint) else { return }
		let request = URLRequest(url: url)

		let session = URLSession.shared
		session.dataTask(with: request) { data, _, error in
			if let error = error {
				fatalError(error.localizedDescription)
			}

			guard let data = data else { return }

			do {
				let jsonDecoder = JSONDecoder()
				let newsData = try jsonDecoder.decode([DTO.NewsRawModel].self, from: data)

				var imageViews = [UIImageView]()
				for number in 0...newsData.count {
					for event in newsData {
						let baseURL = "https://dev-exam.l-tech.ru"
						let relativePath = event.imageRelativePath
						let fullURL = URL(string: baseURL + relativePath)

						imageViews[number].kf.setImage(with: fullURL)
					}
				}
				completion(newsData, imageViews)
			} catch {
				fatalError("Unable to load json data.")
			}
		}.resume()
	}
}
