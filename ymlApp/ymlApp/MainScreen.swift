//
//  MainScreen.swift
//  ymlApp
//
//  Created by Nidhishree on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
class MainScreenModel {
    let imagename: String
    let headerTitle: String
    let descriptionLabel: String
    let logoLabel: String
    init(imagename:String,headerTitle: String, descriptionLabel: String, logoLabel: String) {
        self.imagename = imagename
        self.headerTitle = headerTitle
        self.descriptionLabel = descriptionLabel
        self.logoLabel = logoLabel
    }
}
