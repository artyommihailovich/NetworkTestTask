//
//  MainViewController.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    private let viewModel: MainViewModel
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).do {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
        $0.register(MainCollectionViewCell.self)
    }
    
    private lazy var collectionViewLayout = UICollectionViewFlowLayout().do {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 16
        $0.minimumLineSpacing = 16
        $0.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        $0.itemSize = CGSize(width: view.frame.width - 25, height: 380)
    }
    
    init(viewModel: MainViewModel) {
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
        viewModel.getDataAlbumFromAPI()
        viewModel.viewController = self
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.cells[indexPath.row].itemCell(for: indexPath, in: collectionView)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - contentOffset <= 10.0 {
            viewModel.getMoreDataPhotosFromAPI()
        }
    }
}
