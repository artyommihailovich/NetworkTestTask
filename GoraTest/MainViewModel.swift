//
//  MainViewModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit

final class MainViewModel {
    
    weak var viewController: MainViewController?
    
    let title = "Photos"
    
    private let model: MainModel
    private let networkDataFetcher = DataFetcherService()
    
    private lazy var posts = model.posts
    private(set) lazy var cells = mapCells()

    private var albumId = 0
    
    init(model: MainModel) {
        self.model = model
    }
    
    func getDataAlbumFromAPI() {
        networkDataFetcher.fetchAlbumsFromAPI(userId: model.user.id) { [weak self] albumData in
            guard let self = self, let albumData = albumData else { return }
            self.model.albums.append(contentsOf: albumData)
            if self.model.albums.count > self.albumId {
                self.getDataPhotosFromAPI(with: self.albumId)
                self.albumId += 1
            }
        }
    }
    
    func getDataPhotosFromAPI(with id: Int) {
        networkDataFetcher.fetchPhotosFromAPI(albumId: model.albums[id].id) { [weak self] photoData in
            guard let self = self, let photoData = photoData else { return }
            self.posts.append(contentsOf: photoData)
            self.cells = self.mapCells()
            DispatchQueue.main.async {
                self.viewController?.collectionView.reloadData()
            }
        }
    }
    
    func getMoreDataPhotosFromAPI() {
        getDataPhotosFromAPI(with: albumId)
        albumId += 1
    }
    
    private func mapCells() -> [CellItem] {
        posts.map  {
            MainCollectionViewCellViewModel(title: $0.title, imageUrl: $0.url)
        }
    }
}
