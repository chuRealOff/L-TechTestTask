//
//  DevExamDetailViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation
import UIKit

protocol IDevExamDetailViewController: AnyObject {

}

final class DevExamDetailViewController: UIViewController {
	// MARK: - Dependencies
	private let interactor: IDevExamDetailInteractor

	// MARK: - Initializers
	init(interactor: IDevExamDetailInteractor) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
