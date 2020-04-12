//
//  PostListModel.swift
//  FullStackSocial_ios_lbta
//
//  Created by MCT on 12.04.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct PostListModel {
    var postList : [Post]
}

extension PostListModel{
    
    func numberOfRowsInSection() -> Int {
        return postList.count
    }
    
    func postAtIndex(_ index:Int) -> PostViewModel{
        let post = postList[index]
        return PostViewModel(post: post)
    }
    
    mutating func remove(_ index: Int) {
        self.postList.remove(at: index)
    }
    
}
