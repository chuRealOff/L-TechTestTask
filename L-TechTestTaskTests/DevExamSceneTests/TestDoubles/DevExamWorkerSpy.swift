//
//  DevExamWorkerSpy.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 13.02.2024.
//

import Foundation
import UIKit
@testable import L_TechTestTask

final class DevExamWorkerSpy: IDevExamWorker {
	// MARK: Internal Properties
	private(set) var fetchNetworkDataWasCalled = false

	// MARK: Internal Methods
	func fetchNetworkData(
		from endPoint: String,
		completion: @escaping ((Result<([DTO.NewsRawModel], [UIImageView]), NetworkError>) -> Void)
	) {
		let (newsData, imageViews) = MockDataCreator().createMockData()

		fetchNetworkDataWasCalled = true
		if fetchNetworkDataWasCalled {
			completion(.success((newsData, imageViews)))
		}
	}
}
