//
//  AuthPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 23.03.2024.
//

protocol IAuthPresenter: AnyObject {
	/// Обрабатыает результат авторизации и готовит отчёт для контроллера.
	/// - Parameter authResult: Результат авторизации.
	func present(_ authResponse: LoginModels.AuthResponse)
}

final class AuthPresenter {
	// MARK: - Dependencies
	private weak var viewController: IAuthViewController?

	// MARK: - Initializers
	init(viewController: IAuthViewController) {
		self.viewController = viewController
	}
}

// MARK: - IAuthPresenter Implementation
extension AuthPresenter: IAuthPresenter {
	func present(_ authResponse: LoginModels.AuthResponse) {
		// Подготовка модели AuthResult в зависимости от полученных данных.
		// Последующая передача данных контроллеру.
	}
}
