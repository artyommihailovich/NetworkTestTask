//
//  AppCoordinator.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/3/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    enum Event {
        case cellTapped
    }
    
    var navigationController: UINavigationController
    
    init(navigationController:  UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = StartViewCoordinator().viewController
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func eventHandle(with event: Event, with userData: UserData) {
        switch event {
        case .cellTapped:
            let viewController = MainViewCoordinator(userData: userData).viewController
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}
