//
//  DevExamInteractorSpy.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 19.02.2024.
//

import Foundation
@testable import L_TechTestTask

final class DevExamInteractorSpy: IDevExamInteractor {
	// MARK: Internal Properties
	private(set) var viewIsReadyCalled = false

	// MARK: Internal Methods
	func viewIsReady() {
		viewIsReadyCalled = true
	}

	func rowDidSelect(with data: [L_TechTestTask.DTO.News], at indexPath: IndexPath) {

	}
}
