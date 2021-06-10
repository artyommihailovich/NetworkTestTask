//
//  MainViewModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import Foundation

final class StartViewModel {
    
    weak var viewController: StartViewController?
    
    let title = "Users"
    
    private let model: StartModel
    private let networkDataFetcher = DataFetcherService()
    
    private(set) lazy var users = model.users
    private(set) lazy var cells = mapCells()
    
    init(model: StartModel) {
        self.model = model
    }
    
    func getDataFromAPI() {
        networkDataFetcher.fetchUsersFromAPI { [weak self] userData in
            guard let self = self, let userData = userData else { return }
            self.users.append(contentsOf: userData)
            self.cells = self.mapCells()
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
        }
    }
    
    private func mapCells() -> [CellItem] {
        users.map {
            StartTableViewCellViewModel(text: $0.name)
        }
    }
}
