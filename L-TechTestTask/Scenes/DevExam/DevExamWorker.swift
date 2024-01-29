//
//  DevExamWorker.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 11.12.2023.
//

import Foundation
import UIKit
import Kingfisher

protocol IDevExamWorker {
	/// Загружает данные из сети.
	/// - Parameter endPoint: URL адрес страницы.
	func fetchNetworkData(
		from endPoint: String,
		completion: @escaping ((Result<([DTO.NewsRawModel], [UIImageView]), NetworkError>) -> Void)
	)

	/// Создаёт UIAlertController, ответственный за обработку ошибок сетевых запросов.
	/// - Parameter message: текст сообщения об ошибке.
	func createAlertController() -> UIAlertController
}

final class DevExamWorker: IDevExamWorker {
	// MARK: - Internal Methods
	func fetchNetworkData(
		from endPoint: String,
		completion: @escaping ((Result<([DTO.NewsRawModel], [UIImageView]), NetworkError>) -> Void)
	) {
		guard let url = URL(string: endPoint) else {
			completion(.failure(.invalidURL))
			return
		}

		let request = URLRequest(url: url)

		let session = URLSession.shared
		session.dataTask(with: request) { data, response, error in
			if error != nil {
				completion(.failure(.unableToComplete))
				return
			}

			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completion(.failure(.invalidResponse))
				return
			}

			guard let data = data else {
				completion(.failure(.invalidData))
				return
			}

			do {
				let jsonDecoder = JSONDecoder()
				let newsData = try jsonDecoder.decode([DTO.NewsRawModel].self, from: data)

				DispatchQueue.main.async {
					self.fetchImages(from: newsData) { images in
						completion(.success((newsData, images)))
					}
				}
			} catch {
				print("json decoding error: \(error.localizedDescription).") // Провести рефакторинг
				fatalError("Unable to load json data.")
			}
		}.resume()
	}

	private func fetchImages(from data: [DTO.NewsRawModel], completion: @escaping ([UIImageView]) -> Void) {
		var imageViews = [UIImageView]()
		let baseURL = Constants.baseURLString
		let dispatchGroup = DispatchGroup()
		let serialQueue = DispatchQueue(label: "com.example.L-TechTestTask")

		for event in data {
			let relativePath = event.image

			if let fullPath = URL(string: baseURL + relativePath) {

				dispatchGroup.enter()

				let imageView = UIImageView()
				imageView.kf.setImage(with: fullPath) { result in
					switch result {
					case .success:
						serialQueue.async {
							imageViews.append(imageView)
							dispatchGroup.leave()
						}
					case .failure(let error):
						print("Failed to load image: \(error.localizedDescription)")
						dispatchGroup.leave()
					}
				}
			}
		}
		dispatchGroup.notify(queue: .main) {
			completion(imageViews)
		}
	}

	func createAlertController() -> UIAlertController {
		let alertController = UIAlertController(
			title: "",
			message: "",
			preferredStyle: .alert
		)

		return alertController
	}
}
