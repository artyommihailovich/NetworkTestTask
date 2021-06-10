//
//  StartViewCoordinator.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import Foundation

final class StartViewCoordinator {
    private let model = StartModel()
    private(set) lazy var viewModel = StartViewModel(model: model)
    private(set) lazy var viewController = StartViewController(viewModel: viewModel)
}
