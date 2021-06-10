//
//  Coordinator.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/3/21.
//

import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}
