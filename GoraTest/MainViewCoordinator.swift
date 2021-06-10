//
//  MainViewCoordinator.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import Foundation

final class MainViewCoordinator {
    private let userData: UserData
    private(set) lazy var model = MainModel(user: userData)
    private(set) lazy var viewModel = MainViewModel(model: model)
    private(set) lazy var viewController = MainViewController(viewModel: viewModel)

    init(userData: UserData) {
        self.userData = userData
    }
}
