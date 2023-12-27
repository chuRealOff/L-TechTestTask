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

				DispatchQueue.main.async {
					self.fetchImages(from: newsData) { images in
						completion(newsData, images)
					}
				}
			} catch {
				print("json decoding error: \(error).")
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
}
