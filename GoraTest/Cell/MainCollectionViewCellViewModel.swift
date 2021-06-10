//
//  MainCollectionViewCellViewModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit

final class MainCollectionViewCellViewModel: CollectionCellViewModel, CellItem {
    typealias Cell = MainCollectionViewCell
    
    let title: String
    let imageUrl: String

    init(title: String, imageUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
    }
}
