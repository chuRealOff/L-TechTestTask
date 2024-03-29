//
//  L_TechTestTaskTests.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 12.02.2024.
//

import XCTest
@testable import L_TechTestTask

final class DevExamInteractorTests: XCTestCase {
	private let presenter = DevExamPresenterSpy()
	private let worker = DevExamWorkerSpy()

	func test_viewIsReady_methodWorkedOutProperly() {
		let sut = makeSut()

		sut.viewIsReady()

		XCTAssertTrue(worker.fetchNetworkDataWasCalled, "'worker.fetchNetworkData' не отработал!")
		XCTAssertTrue(presenter.presentWasCalled, "'presenter.present' не отработал!")
	}
}

private extension DevExamInteractorTests {
	/// Создает DevExamInteractor, подлежащего тестированию.
	/// - Returns: DevExamInteractor.
	func makeSut() -> DevExamInteractor {
		let coordinator = DevExamCoordinator(navigationController: UINavigationController())
		let interactor = DevExamInteractor(presenter: presenter, worker: worker, coordinator: coordinator)

		return interactor
	}
}
