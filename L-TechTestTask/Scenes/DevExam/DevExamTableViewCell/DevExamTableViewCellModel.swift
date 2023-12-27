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
		UILayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configuration
	/// Наполняет свойства ячейки данными из модели.
	func configure(with data: [DTO.News], at indexPath: IndexPath) {
		self.myImageView.image = data[indexPath.row].image
		self.titleLabel.text = data[indexPath.row].title
		self.txtLabel.text = data[indexPath.row].text
		self.dateLabel.text = data[indexPath.row].date
	}

	// MARK: - Setup UI Layout
	private func UILayout() {
		contentView.addSubview(myImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(txtLabel)
		contentView.addSubview(dateLabel)

		myImageView.snp.makeConstraints { make in
			make.width.height.equalTo(80)
			make.centerY.leading.equalToSuperview()
		}

		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(myImageView.snp.top)
			make.leading.equalTo(myImageView.snp.trailing)
			make.trailing.equalToSuperview().offset(-10)
			make.height.equalTo(20)
		}

		txtLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom)
			make.leading.trailing.equalTo(titleLabel)
			make.bottom.equalTo(myImageView)
		}

		dateLabel.snp.makeConstraints { make in
			make.top.equalTo(txtLabel.snp.bottom)
			make.leading.trailing.equalTo(txtLabel)
			make.bottom.equalToSuperview()
		}
	}

	// MARK: - UI Elements Creation
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
