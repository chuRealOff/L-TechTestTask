//
//  AuthViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 23.03.2024.
//

import Foundation
import UIKit
import SnapKit

protocol IAuthViewController: AnyObject {
	/// Обрабатывает результат авторизации пользователя и отдаёт команду 
	/// о переходе на главную сцену приложения, либо о выводе служебного сообщения об ошибке.
	func getAuthorization(considering result: LoginModels.AuthResult)
}

/// Экран сцены Авторизации.
final class AuthViewController: UIViewController {
	// MARK: - Dependencies
	private let interactor: IAuthInteractor

	// MARK: - UI Elements

	// MARK: - Initializers
	init(interactor: IAuthInteractor) {
		self.interactor = interactor
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - IAuthViewController Implementation
extension AuthViewController: IAuthViewController {
	func getAuthorization(considering result: LoginModels.AuthResult) {
		// Проверка результата авторизации.
	}
}
