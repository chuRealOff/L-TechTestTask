//
//  LoginModels.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 23.03.2024.
//

/// Модели данных для работы со сценой  авторизации.
enum LoginModels {

	/// Модель данных для  авторизации.
	struct AuthRequest {
		let login: String
		let password: String
	}

	/// Результат авторизации, возвращаемый интерактором.
	struct AuthResponse {
		let isAuthorized: Bool
	}

	/// Результат авторизации, обрабатываемый контроллером.
	enum AuthResult {
		case success
		case failure(String)
	}

	/// Маска номера телефона.
	struct CellPhoneMask: Decodable {
		let phoneMask: String
	}
}
