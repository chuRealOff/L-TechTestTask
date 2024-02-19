//
//  DevExamPresenterTests.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 12.02.2024.
//

import XCTest
@testable import L_TechTestTask

final class DevExamPresenterTests: XCTestCase, Mockable {
	private let viewController = DevExamViewControllerSpy()

	func test_present_methodWorkedOut() {
		let sut = makeSut()
		let (newsData, imageViews) = MockDataCreator().createMockData()

		sut.present(with: newsData, and: imageViews)

		XCTAssertTrue(viewController.renderWasCalled, "'viewController.render' не отработал!")
		XCTAssertFalse(viewController.newsData.isEmpty, "Массив данных контроллера не должен быть пустым.")
	}

}

private extension DevExamPresenterTests {
	/// Создает DevExamPresenter, подлежащего тестированию.
	/// - Returns: DevExamPresenter.
	func makeSut() -> DevExamPresenter {
		let presenter = DevExamPresenter()
		presenter.viewController = viewController

		return presenter
	}
}
