//
//  DevExamTableViewCellModel.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 14.12.2023.
//

import UIKit
import SnapKit

final class DevExamTableViewCell: UITableViewCell {
	// MARK: - Static Properties
	static let identifier = "DevExamTableViewCell"

	// MARK: - UI Elements
	private lazy var myImageView: UIImageView = makeImageView()

	private lazy var titleLabel: UILabel = makeTitleLabel()

	private lazy var txtLabel: UILabel = makeTextLabel()

	private lazy var dateLabel: UILabel = makeDateLabel()

	// MARK: - Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configuration
	func configure(
		with image: UIImage,
		titleString: String,
		textString: String,
		dateString: String
	) {
		self.myImageView.image = image
		self.titleLabel.text = titleString
		self.txtLabel.text = textString
		self.dateLabel.text = dateString
	}

	// MARK: - UI Creation
	private func makeImageView() -> UIImageView {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit

		return imageView
	}

	private func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.textAlignment = .left
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 15, weight: .bold)

		return label
	}

	private func makeTextLabel() -> UILabel {
		let label = UILabel()
		label.numberOfLines = 0
		label.textAlignment = .left
		label.font = UIFont.systemFont(ofSize: 15)

		return label
	}

	private func makeDateLabel() -> UILabel {
		let label = UILabel()
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 15)

		return label
	}
}
