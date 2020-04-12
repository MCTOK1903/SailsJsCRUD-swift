//
//  Post.swift
//  FullStackSocial_ios_lbta
//
//  Created by MCT on 12.04.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct Post:Decodable{
    let id: Int
    let title: String
    let body: String
}
