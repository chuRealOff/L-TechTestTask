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
		completion: @escaping ((Result<([L_TechTestTask.DTO.NewsRawModel], [UIImageView]), L_TechTestTask.NetworkError>) -> Void)
	) {
		fetchNetworkDataWasCalled = true
	}
	

}
