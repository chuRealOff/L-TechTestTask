//
//  AuthInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 23.03.2024.
//

protocol IAuthInteractor: AnyObject {
	/// Проверяет входные данные на соответствие.
	/// - Parameter request: Логин и Пароль, переданные пользователем.
	func signIn(with request: LoginModels.AuthRequest)
}

final class AuthInteractor {
	// MARK: - Dependencies
	private let presenter: IAuthPresenter

	// MARK: - Initializers
	init(presenter: IAuthPresenter) {
		self.presenter = presenter
	}
}

// MARK: - IAuthInteractor Implementation
extension AuthInteractor: IAuthInteractor {
	func signIn(with request: LoginModels.AuthRequest) {
		// Создание логина и пароля.
		// Передача им данных из реквеста.
		// Дальше воркер проводит работу на соответствие данных.
	}
}
