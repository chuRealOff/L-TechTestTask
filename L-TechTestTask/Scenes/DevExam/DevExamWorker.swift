//
//  DevExamWorker.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 11.12.2023.
//

import Foundation

protocol IDevExamWorker {
	/// Загружает данные из сети.
	/// - Parameter endPoint: URL адрес страницы.
	func fetchNetworkData(from endPoint: String, completion: @escaping ([NewsModel]) -> Void)
}

final class DevExamWorker: IDevExamWorker {
	func fetchNetworkData(from endPoint: String, completion: @escaping ([NewsModel]) -> Void) {
		guard let url = URL(string: endPoint) else { return }
		let request = URLRequest(url: url)


		let session = URLSession.shared
		session.dataTask(with: request) { data, response, error in
			guard let data = data else { return }

			do {
				let jsonDecoder = JSONDecoder()
				let newsData = try jsonDecoder.decode([NewsModel].self, from: data)
				completion(newsData)
			} catch {
				fatalError("Unable to load json data.")
			}
		}.resume()
	}
}
