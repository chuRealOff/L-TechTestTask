//
//  DevExamPresenterSpy.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 13.02.2024.
//

import Foundation
import UIKit
@testable import L_TechTestTask

final class DevExamPresenterSpy: IDevExamPresenter {
	// MARK: Internal Properties
	private(set) var presentWasCalled = false

	// MARK: Internal Methods
	func present(with newsData: [DTO.NewsRawModel], and pictures: [UIImageView]) {
		presentWasCalled = true
	}
}
