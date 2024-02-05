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

}

final class DevExamDetailViewController: UIViewController {
	// MARK: - Dependencies
	private let interactor: IDevExamDetailInteractor

	// MARK: - UI Elements
	private lazy var scrollView: UIScrollView = makeRootScrollView()
	private lazy var stackView: UIStackView = makeStackView()
	private lazy var dateLabel = makeDateLabel()
	private lazy var titleLabel = makeTitleLabel()
	private lazy var imageView = makeImageView()
	private lazy var textView = makeTextView()

	// MARK: - Computed Properties
	private var scrollViewContentSize: CGSize {
//		CGSize(width: view.frame.width, height: view.frame.height + 400)
		stackView.frame.size
	}

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
		setupUI()
	}

	// MARK: - Private Methods
	private func makeRootScrollView() -> UIScrollView {
		let scrollView = UIScrollView(frame: view.bounds)
		scrollView.contentSize = scrollViewContentSize
		scrollView.backgroundColor = .systemOrange

		return scrollView
	}

	private func makeStackView() -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.backgroundColor = .cyan

		return stackView
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

	private func makeTextView() -> UITextView {
		let textView = UITextView()

		return textView
	}

	/// Настраивает размещение всех дочерних view элементов на экране.
	private func setupUI() {
		view.addSubview(scrollView)
		scrollView.addSubview(stackView)
		stackView.addArrangedSubview(dateLabel)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(textView)

		scrollView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		stackView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}

// MARK: - IDevExamDetailViewController Implementation
extension DevExamDetailViewController: IDevExamDetailViewController {

}
