//
//  DevExamDetailPresenter.swift
//  L-TechTestTask
//
//  Created by CHURILOV DMITRIY on 31.01.2024.
//

import Foundation

protocol IDevExamDetailPresenter: AnyObject {

}

final class DevExamDetailPresenter: IDevExamDetailPresenter {
	// MARK: - Dependencies
	weak var viewController: IDevExamDetailViewController?
}
