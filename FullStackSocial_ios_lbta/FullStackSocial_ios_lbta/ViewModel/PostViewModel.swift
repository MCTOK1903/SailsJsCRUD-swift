//
//  PostViewModel.swift
//  FullStackSocial_ios_lbta
//
//  Created by MCT on 12.04.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct PostViewModel{
    let post : Post
}

extension PostViewModel{
    var id: Int {
        return self.post.id
    }
    var title : String {
        return self.post.title
    }
    var body : String {
        return self.post.body
    }
}





