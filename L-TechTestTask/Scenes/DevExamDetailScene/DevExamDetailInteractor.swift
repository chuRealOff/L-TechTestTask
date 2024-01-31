//
//  DevExamDetailInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation

protocol IDevExamDetailInteractor: AnyObject {

}

final class DevExamDetailInteractor: IDevExamDetailInteractor {
	// MARK: - Dependencies
	private let presenter: IDevExamDetailPresenter

	// MARK: - Initializer
	init(presenter: IDevExamDetailPresenter) {
		self.presenter = presenter
	}
}
