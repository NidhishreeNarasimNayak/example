//
//  File.swift
//  ymlApp
//
//  Created by Nidhishree on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
class NewsModel
{
    let image: String
    let category: String
    let description: String
    let url: String
    init(image: String, category: String, description: String, url: String) {
        self.image = image
        self.category = category
        self.description = description
        self.url = url
    }
}

