//
//  NetworkError.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 28.01.2024.
//

import Foundation

/// Кастомный тип данных для обработки ошибок, связанных с сетевым запросом.
enum NetworkError: String, Error {
	case invalidURL = "Invalid URL. Please try again."
	case unableToComplete = "Unable to complete your request. Please check your internet connection."
	case invalidResponse = "Invalid response from the server. Please try again."
	case invalidData = "The data received from the server was invalid. Please try again."
}
