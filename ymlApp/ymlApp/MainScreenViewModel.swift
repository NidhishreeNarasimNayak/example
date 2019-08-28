//
//  MainScreenViewModel.swift
//  ymlApp
//
//  Created by Nidhishree on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
class MainScreenViewModel {
    
    var mainScreen: [MainScreenModel] = []
    
    func homeScreenObjects() {
        let hello = MainScreenModel(imagename: "", headerTitle: "Hello.", descriptionLabel: "We are a design and innovation agency, creating digital products and experiences that have a lasting impact.", logoLabel: "")
        let stateFarm = MainScreenModel(imagename: "Image-0", headerTitle: "State Farm", descriptionLabel: "All things insurance, all things banking, all in one app.", logoLabel: "Logo-0")
        let theHomeDepot = MainScreenModel(imagename: "Image-1", headerTitle: "The Home Depot", descriptionLabel: "The ultimate power tool: A best-in-class digital experience for The Home Depot.", logoLabel: "Logo-1")
        let payPal = MainScreenModel(imagename: "Image-2", headerTitle: "PayPal", descriptionLabel: "Payment giant goes mobile-by-design.", logoLabel: "Logo-2")
        let molekule = MainScreenModel(imagename: "Image-3", headerTitle: "Molekule", descriptionLabel:"The world's first intelligent air purifier, & the app putting clean air in people's hands.", logoLabel: "Logo-3")
        mainScreen = [hello,stateFarm,theHomeDepot,payPal,molekule]
      }
}
