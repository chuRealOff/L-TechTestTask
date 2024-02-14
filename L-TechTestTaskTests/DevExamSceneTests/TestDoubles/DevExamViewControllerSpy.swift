//
//  DevExamViewControllerSpy.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 14.02.2024.
//

import Foundation
@testable import L_TechTestTask

final class DevExamViewControllerSpy: IDevExamViewController {
	// MARK: Internal Properties
	private(set) var renderWasCalled = false

	// MARK: Internal Methods
	func render(with news: [DTO.News]) {
		renderWasCalled = true
	}
}
