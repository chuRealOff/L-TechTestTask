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

	// MARK: - Computed Properties
	private var scrollViewContentSize: CGSize {
		CGSize(width: view.frame.width, height: view.frame.height + 400)
	}

	// MARK: - Initializers
	init(interactor: IDevExamDetailInteractor) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

//	// MARK: - ViewController Lifecycle
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//	}

	// MARK: - Private Methods
	private func makeRootScrollView() -> UIScrollView {
		let scrollView = UIScrollView(frame: view.bounds)
		scrollView.contentSize = scrollViewContentSize
		scrollView.backgroundColor = .white

		return scrollView
	}
}

// MARK: - IDevExamDetailViewController Implementation
extension DevExamDetailViewController: IDevExamDetailViewController {

}
