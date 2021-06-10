//
//  DataFetcherService.swift
//  Network
//
//  Created by Artyom Mihailovich on 1/26/21.
//

import Foundation

final class DataFetcherService {
    
    private let baseUrl = "https://jsonplaceholder.typicode.com"
    
    private var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchUsersFromAPI(completion: @escaping([UserData]?) -> Void) {
        let urlString = baseUrl + "/users"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString , response: completion)
    }
    
    func fetchPhotosFromAPI(albumId: Int, completion: @escaping([PostData]?) -> Void) {
        let urlString = baseUrl + "/photos?" + "albumId=\(albumId)"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchAlbumsFromAPI(userId: Int, completion: @escaping([AlbumData]?) -> Void) {
        let urlString =  baseUrl + "/albums?" + "userId=\(userId)"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
}
