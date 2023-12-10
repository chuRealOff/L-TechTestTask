//
//  DevExamInteractor.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation

protocol IDevExamInteractor {
	func fetchNetworkData()
	func rowDidSelect(atIndexPath indexPath: IndexPath)
}

final class DevExamInteractor: IDevExamInteractor {
	// MARK: - Parameters
	private let presenter: IDevExamPresenter

	// MARK: - Initializer
	init(presenter: IDevExamPresenter) {
		self.presenter = presenter
	}

	// MARK: - Business Logic
	func rowDidSelect(atIndexPath indexPath: IndexPath) {
		//
	}

	func fetchNetworkData() {
		//
	}
}
