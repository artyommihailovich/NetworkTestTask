//
//  UITableView.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import UIKit

public extension UITableView {
    func dequeueCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: Cell.id, for: indexPath) as! Cell
    }

    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.id)
    }
}
