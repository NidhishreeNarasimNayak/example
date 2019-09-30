//
//  AboutUsVM.swift
//  ymlApp
//
//  Created by Nidhishree on 29/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
class AboutUsViewModel: BaseVM {
    var acessImages: [aboutUs]  = []
    override init() {
   acessImages = [aboutUs(image: "about1"), aboutUs(image: "about2"), aboutUs(image: "about3"),aboutUs(image: "about4")]
    }
}
