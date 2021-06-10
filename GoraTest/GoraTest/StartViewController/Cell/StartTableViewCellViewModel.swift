//
//  StartTableViewCellViewModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import Foundation

final class StartTableViewCellViewModel: TableCellViewModel, CellItem {
    typealias Cell = StartTableViewCell
    
    let text: String
    
    init(text: String) {
        self.text = text
    }
}
