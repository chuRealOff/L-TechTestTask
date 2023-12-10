//
//  DevExamPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 10.12.2023.
//

import Foundation

protocol IDevExamPresenter {
	func present()
}

final class DevExamPresenter: IDevExamPresenter {
	// MARK: - Parameters
	weak private var viewController: IDevExamViewController?

	// MARK: - Protocol Implementation
	func present() {
		//
	}
}
