//
//  DevExamViewControllerTests.swift
//  L-TechTestTaskTests
//
//  Created by CHURILOV DMITRIY on 12.02.2024.
//

import XCTest
@testable import L_TechTestTask

final class DevExamViewControllerTests: XCTestCase, Mockable {
	private var newsDataList = [DTO.News]()
	private let interactor = DevExamInteractorSpy()

	func test_render_methodWorkedOutProperly() {
		let sut = makeSut()

		sut.render(with: newsDataList)

		XCTAssertTrue(interactor.viewIsReadyCalled, "'interactor.viewIsReady' не отработал!")
	}
}

private extension DevExamViewControllerTests {
	/// Создает DevExamViewController, подлежащего тестированию.
	/// - Returns: DevExamViewController.
	func makeSut() -> DevExamViewController {
		let viewController = DevExamViewController(interactor: interactor)
		populateNewsData()

		return viewController
	}

	func populateNewsData() {
		let (newsData, imageViews) = MockDataCreator().createMockData()

		for (index, particularData) in newsData.enumerated() {
			var news = [DTO.News]()

			let image = imageViews[index].image

			let story = DTO.News(
				title: particularData.title,
				text: particularData.text,
				sort: particularData.sort,
				date: particularData.date,
				image: image
			)
			news.append(story)
			newsDataList = news
		}
	}
}
