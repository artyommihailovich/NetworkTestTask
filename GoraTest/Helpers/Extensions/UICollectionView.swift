//
//  UICollectionView.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit

public extension UICollectionView {
    func dequeueCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath) as! Cell
    }

    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type.self, forCellWithReuseIdentifier: type.id)
    }

    func dequeueView<View: UICollectionReusableView>(for indexPath: IndexPath) -> View {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                         withReuseIdentifier: View.id,
                                         for: indexPath) as! View
    }

    func register<View: UICollectionReusableView>(_ type: View.Type) {
        register(type.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: View.id)
    }
}
