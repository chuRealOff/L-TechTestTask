//
//  DevExamWorkerSpy.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 13.02.2024.
//

import Foundation
import UIKit
@testable import L_TechTestTask

final class DevExamWorkerSpy: IDevExamWorker, Mockable {
	// MARK: Internal Properties
	private(set) var fetchNetworkDataWasCalled = false

	// MARK: Internal Methods
	func fetchNetworkData(
		from endPoint: String,
		completion: @escaping ((Result<([DTO.NewsRawModel], [UIImageView]), NetworkError>) -> Void)
	) {
		let newsData = loadData(fileName: "newsMockData", type: DTO.NewsRawModel.self)
		let forestImage = UIImage(named: "forest")
		let forestImageView = UIImageView.init(image: forestImage)
		let fieldImage = UIImage(named: "field")
		let fieldImageView = UIImageView.init(image: fieldImage)
		let imageViews = [forestImageView, fieldImageView]

		fetchNetworkDataWasCalled = true
		if fetchNetworkDataWasCalled {
			completion(.success((newsData, imageViews)))
		}
	}
}
