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
	func render(with news: [DTO.News])
}

final class DevExamViewController: UITabBarController {
	// MARK: - Private Properties
	private var newsData: [DTO.News] = []
	private let interactor: IDevExamInteractor
	lazy private var tableView: UITableView = makeTableView()
	lazy private var filterButton: UIButton = makeSortButton()

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
		super.viewWillLayoutSubviews()
		setupUI()
		makeRefreshPageNavigationItem()
	}

	@objc
	func refreshPage() {

	}

	// MARK: - Private Methods
	private func tabBarControllerSetup() {

	}

	/// Создаёт таблицу для  свойства своего класса.
	private func makeTableView() -> UITableView {
		let tableView = UITableView()
		tableView.register(DevExamTableViewCell.self, forCellReuseIdentifier: DevExamTableViewCell.identifier)
		tableView.rowHeight = UITableView.automaticDimension
		tableView.allowsSelection = true
		tableView.delegate = self
		tableView.dataSource = self

		return tableView
	}

	/// Создаёт кнопку сортировки контента на главном экране.
	private func makeSortButton() -> UIButton {
		let button = UIButton()
		button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		button.tintColor = .black

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "arrowtriangle.down.fill")

		let imageString = NSAttributedString(attachment: imageAttachment)
		let titleString = NSAttributedString(string: "По умолчанию")

		let combination = NSMutableAttributedString()
		combination.append(NSAttributedString(string: " "))
		combination.append(titleString)
		combination.append(imageString)

		button.setAttributedTitle(combination, for: .normal)
		button.semanticContentAttribute = .forceLeftToRight

		return button
	}

	/// Добавляет кнопку обновления данных экрана в навигационную панель.
	private func makeRefreshPageNavigationItem() {
		navigationController?.navigationBar.tintColor = .black
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			image: UIImage(systemName: "arrow.triangle.2.circlepath"),
			style: .done,
			target: self,
			action: #selector(refreshPage)
		)
	}

	/// Настраивает размещение всех дочерних view элементов на экране.
	private func setupUI() {
		navigationController?.hidesBarsOnSwipe = true
		view.addSubview(filterButton)
		view.addSubview(tableView)

		filterButton.snp.makeConstraints { make in
			make.width.equalTo(130)
			make.height.equalTo(20)
			make.leading.equalToSuperview().offset(16)
			make.top.equalToSuperview().offset(90)
		}

		tableView.snp.makeConstraints { make in
			make.top.equalTo(filterButton.snp.bottom)
			make.leading.equalToSuperview().offset(16)
			make.trailing.equalToSuperview()
			make.bottom.equalTo(tabBar.snp.top)
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
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: DevExamTableViewCell.identifier,
			for: indexPath
		) as? DevExamTableViewCell else {
			return UITableViewCell()
		}
		cell.configure(with: newsData, at: indexPath)

		return cell
	}
}

// MARK: - IDevExamViewController Implementation
extension DevExamViewController: IDevExamViewController {
	func render(with news: [DTO.News]) {
		newsData = news
		tableView.reloadData()
	}
}
