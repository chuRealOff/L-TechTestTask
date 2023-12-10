//
//  ViewController.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 09.12.2023.
//

import UIKit

protocol IDevExamViewController: AnyObject {
	func viewRender()
}

final class DevExamViewController: UITabBarController {
	// MARK: - Parameters
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
		
	}


}

extension DevExamViewController: IDevExamViewController {
	func viewRender() {
		//
	}
	

}
