//
//  ViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 09.12.2023.
//

import UIKit

protocol IDevExamViewController: AnyObject {
	/// Запись в массив данных  контроллера и отображение содержимого массива на экране.
	/// - Parameter news: массив данных, необходимых контроллеру для отображения.
	func viewRender(with news: [NewsModel])
}

final class DevExamViewController: UITabBarController {
	// MARK: - Private Properties
	private var newsData: [NewsModel] = []
	private let interactor: IDevExamInteractor

	// MARK: - Initializers
	init(interactor: IDevExamInteractor) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - ViewController Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		interactor.viewIsReady()
	}
}

// MARK: - IDevExamViewController Implementation
extension DevExamViewController: IDevExamViewController {
	func viewRender(with news: [NewsModel]) {
		newsData = news
	}

}
