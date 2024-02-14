//
//  Mockable.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 14.02.2024.
//

import Foundation

/// Имитирует загрузку данных из сети, работая с моковыми данными.
protocol Mockable: AnyObject {
	var bundle: Bundle { get }
	func loadData<T: Decodable>(fileName: String, type: T.Type) -> [T]
}

extension Mockable {
	var bundle: Bundle {
		return Bundle(for: type(of: self))
	}

	/// Проводит загрузку данных из локального хранилища.
	/// - Parameters:
	///   - fileName: Имя файла.
	///   - type: Тип файла.
	/// - Returns: Массив универсальных данных.
	func loadData<T: Decodable>(fileName: String, type: T.Type) -> [T] {
		guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
			fatalError("Failed to load JSON file.")
		}

		do {
			let data = try Data(contentsOf: path)
			let decodedObject = try JSONDecoder().decode([T].self, from: data)

			return decodedObject
		} catch {
			print("❌ \(error)")
			fatalError("Failed to decode the JSON.")
		}
	}
}
