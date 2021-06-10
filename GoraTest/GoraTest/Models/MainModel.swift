//
//  MainModel.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import Foundation

final class MainModel {
    
    let user: UserData
    var posts = [PostData]()
    var albums = [AlbumData]()
    
    init(user: UserData) {
        self.user = user
    }
}
