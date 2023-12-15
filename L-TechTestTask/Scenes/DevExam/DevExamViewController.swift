//
//  ViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 09.12.2023.
//

import UIKit
import SnapKit

protocol IDevExamViewController: AnyObject {
	/// Запись в массив данных  контроллера и отображение содержимого массива на экране.
	/// - Parameter news: массив данных, необходимых контроллеру для отображения.
	func viewRender(with news: [NewsModel])
}

final class DevExamViewController: UITabBarController {
	// MARK: - Private Properties
	private var newsData: [NewsModel] = []
	private let interactor: IDevExamInteractor
	lazy private var tableView: UITableView = makeTableView()

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
		view.backgroundColor = .white
		title = "Лента новостей"
	}

	override func viewWillLayoutSubviews() {
		setupUI()
	}

	// MARK: - Private Methods
	private func tabBarControllerSetup() {

	}
	
	/// Создаёт таблицу для  свойства своего класса.
	private func makeTableView() -> UITableView {
		let tableView = UITableView()
		tableView.register(DevExamTableViewCell.self, forCellReuseIdentifier: DevExamTableViewCell.identifier)
		tableView.backgroundView?.backgroundColor = .yellow
		tableView.allowsSelection = true
		tableView.delegate = self
		tableView.dataSource = self

		return tableView
	}

	/// Настраивает размещение всех дочерних view элементов на экране.
	private func setupUI() {
		view.addSubview(tableView)

		tableView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
		}
	}
}

// MARK: - UITableViewDelegate Implementation
extension DevExamViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//
	}
}

// MARK: - UITableViewDataSource Implementation
extension DevExamViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		newsData.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = DevExamTableViewCell()

		return UITableViewCell()
	}
}

// MARK: - IDevExamViewController Implementation
extension DevExamViewController: IDevExamViewController {
	func viewRender(with news: [NewsModel]) {
		newsData = news
	}

}
