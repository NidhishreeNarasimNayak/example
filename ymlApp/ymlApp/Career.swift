//
//  Career.swift
//  ymlApp
//
//  Created by Nidhishree on 28/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
struct Root: Decodable{
    let data: [BoardMembers]
}
struct BoardMembers: Decodable{
    let domain: String
    let position: String
    let location: String
}
