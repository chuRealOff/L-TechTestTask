//
//  DevExamDetailViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation
import UIKit
import SnapKit

protocol IDevExamDetailViewController: AnyObject {
	/// Производит наполнение элементов интерфейса контроллера данными.
	/// - Parameter data: Данные для отображения на экране контроллера.
	func render(with data: DTO.News)
}

final class DevExamDetailViewController: UIViewController {
	// MARK: - Dependencies
	private let interactor: IDevExamDetailInteractor

	// MARK: - UI Elements
	private lazy var scrollView: UIScrollView = makeScrollView()
	private lazy var contentView = UIView()
	private lazy var dateLabel: UILabel = makeDateLabel()
	private lazy var titleLabel: UILabel = makeTitleLabel()
	private lazy var imageView: UIImageView = makeImageView()
	private lazy var textLabel: UILabel = makeTextLabel()

	// MARK: - Initializers
	init(interactor: IDevExamDetailInteractor) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - ViewController Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		setupUI()
		interactor.viewIsReady()
	}

	// MARK: - Private Methods
	private func makeScrollView() -> UIScrollView {
		let scrollView = UIScrollView(frame: view.bounds)
		scrollView.backgroundColor = .white

		return scrollView
	}

	private func makeDateLabel() -> UILabel {
		let label = UILabel()
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 15)

		return label
	}

	private func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.textAlignment = .left
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)

		return label
	}

	private func makeImageView() -> UIImageView {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit

		return imageView
	}

	private func makeTextLabel() -> UILabel {
		let textLabel = UILabel()
		textLabel.numberOfLines = 0
		textLabel.textAlignment = .left

		return textLabel
	}

	/// Добавляет кнопку 'like' в навигационную панель.
	private func makeLikeBarButtonNavigationItem() {
		navigationController?.navigationBar.tintColor = .black
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			image: UIImage(systemName: "suit.heart"),
			style: .done,
			target: self,
			action: #selector(likeButtonTapped)
		)
	}

	@objc
	private func likeButtonTapped() {

	}

	/// Настраивает размещение всех дочерних view элементов на экране.
	private func setupUI() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		contentView.addSubview(dateLabel)
		contentView.addSubview(titleLabel)
		contentView.addSubview(imageView)
		contentView.addSubview(textLabel)

		scrollView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		contentView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
			make.width.equalTo(view.snp.width)
		}

		dateLabel.snp.makeConstraints { make in
			make.top.left.right.equalToSuperview().inset(16)
			make.height.equalTo(18)
		}

		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(dateLabel.snp.bottom).offset(16)
			make.left.right.equalToSuperview().inset(16)
			make.height.equalTo(48)
		}

		imageView.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(16)
			make.left.right.equalToSuperview().inset(16)
			make.height.equalTo(226)
		}

		textLabel.snp.makeConstraints { make in
			make.top.equalTo(imageView.snp.bottom).offset(16)
			make.left.right.equalToSuperview().inset(16)
			make.bottom.equalTo(contentView)
		}
	}
}

// MARK: - IDevExamDetailViewController Implementation
extension DevExamDetailViewController: IDevExamDetailViewController {
	func render(with data: DTO.News) {
		dateLabel.text = data.date
		titleLabel.text = data.title
		imageView.image = data.image
		textLabel.text = data.text
	}
}
