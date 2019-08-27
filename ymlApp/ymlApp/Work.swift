//
//  Work.swift
//  ymlApp
//
//  Created by Nidhishree on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
class WorkModel {
    let imagename: String
    let headertitle: String
    let description: String
    let url:String
    init(imagename: String, headertitle: String, description: String, url: String) {
        self.imagename = imagename
        self.headertitle = headertitle
        self.description = description
        self.url = url
    }
}
