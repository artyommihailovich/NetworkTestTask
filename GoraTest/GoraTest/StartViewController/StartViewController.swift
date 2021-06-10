//
//  StartViewController.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/3/21.
//

import UIKit

final class StartViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    private let viewModel: StartViewModel

    lazy var tableView = UITableView().do {
        $0.dataSource = self
        $0.delegate = self
        $0.tableFooterView = UIView()
        $0.register(StartTableViewCell.self)
    }
    
    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupSubviews()
        viewModel.getDataFromAPI()
        viewModel.viewController = self
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension StartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cells[indexPath.row].itemCell(for: indexPath, in: tableView)
    }
}

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.eventHandle(with: .cellTapped, with: viewModel.users[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
