//
//  CellViewModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import UIKit

public protocol CollectionCellViewModel {
    associatedtype Cell: ViewModelAcceptingCollectionViewCell
}

public protocol ViewModelAcceptingCollectionViewCell where Self: UICollectionViewCell {
    associatedtype ViewModel
    
    var viewModel: ViewModel? { get set }
}

public protocol TableCellViewModel {
    associatedtype Cell: ViewModelAcceptingTableViewCell
}

public protocol ViewModelAcceptingTableViewCell where Self: UITableViewCell {
    associatedtype ViewModel

    var viewModel: ViewModel? { get set }
}

public protocol CellItem {
    func itemCell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    func itemCell(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
}

public extension CellItem where Self: TableCellViewModel {
    func itemCell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell(for: indexPath)
        cell.viewModel = self as? Cell.ViewModel
        return cell
    }

    func itemCell(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        fatalError()
    }
}

public extension CellItem where Self: CollectionCellViewModel {
    func itemCell(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let cell: Cell = collectionView.dequeueCell(for: indexPath)
        cell.viewModel = self as? Cell.ViewModel
        return cell
    }

    func itemCell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        fatalError()
    }
}
