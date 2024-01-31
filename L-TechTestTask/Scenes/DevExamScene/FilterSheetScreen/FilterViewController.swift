//
//  FilterViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.12.2023.
//

import UIKit

/// Контроллер, отвечающий за сортировку содержимого экрана главного контроллера.
class FilterViewController: UIViewController {
	lazy private var tableView: UITableView = makeTableView()

//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//	}

	// MARK: - Private Methods
	private func makeTableView() -> UITableView {
		let tableView = UITableView()
		tableView.register(DevExamTableViewCell.self, forCellReuseIdentifier: DevExamTableViewCell.identifier) // исправить
		tableView.rowHeight = UITableView.automaticDimension
		tableView.allowsSelection = true
		tableView.delegate = self
		tableView.dataSource = self

		return tableView
	}

}

// MARK: - UITableViewDelegate Implementation
extension FilterViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//
	}
}

// MARK: - UITableViewDataSource Implementation
extension FilterViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
