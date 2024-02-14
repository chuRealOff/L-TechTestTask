//
//  L_TechTestTaskTests.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 12.02.2024.
//

import XCTest
@testable import L_TechTestTask

final class DevExamInteractorTests: XCTestCase {
	let presenter = DevExamPresenterSpy()
	let worker = DevExamWorkerSpy()

	func test_viewIsReady_workedOut() {
		let sut = makeSut()

		sut.viewIsReady()

		XCTAssertTrue(worker.fetchNetworkDataWasCalled, "'worker.fetchNetworkData' не отработал!")
		XCTAssertTrue(presenter.presentWasCalled, "'presenter.present' не отработал!")
	}
}

private extension DevExamInteractorTests {
	/// Создание DevExamInteractor, подлежащего тестированию.
	/// - Returns: DevExamInteractor.
	func makeSut() -> IDevExamInteractor {
		let coordinator = DevExamCoordinator(navigationController: UINavigationController())
		let interactor = DevExamInteractor(presenter: presenter, worker: worker, coordinator: coordinator)

		return interactor
	}
}
