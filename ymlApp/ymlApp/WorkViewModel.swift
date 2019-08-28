//
//  WorkViewModel.swift
//  ymlApp
//
//  Created by Nidhishree on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class WorkViewModel {
    
    var workScreen: [WorkModel] = []
    
    func workScreenObjects() {
        let northFace = WorkModel(imagename: "northFace", headertitle: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors.",url: "https://ymedialabs.com/project/the-north-face")
        let cloverGo = WorkModel(imagename: "cloverGo", headertitle: "CLOVER", description: "How CLover Go has become an open ecosystem for point-of-sale payments.",url: "https://ymedialabs.com/project/clover")
        let creditOne = WorkModel(imagename: "creditOne", headertitle: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer.",url: "https://ymedialabs.com/project/credit-one")
        workScreen = [northFace,cloverGo,creditOne]
        
    }
}
