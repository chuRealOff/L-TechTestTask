//
//  NewsModel.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation


/// Модель данных для отображения на основном экране.
struct NewsModel: Decodable {
	let id: String
	let title: String
	let text: String
	let image: String
	let sort: Int
	let date: String
}
