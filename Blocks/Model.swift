//
//  Model.swift
//  Blocks
//
//  Created by Quan on 7/27/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class Model {
    var name: String?
    var height: String?
    var sodo3vong: String?
    var stringUrl: String?
    
    init(name: String, height: String, sode3vong: String, stringUrl: String) {
        self.name = name
        self.height = height
        self.sodo3vong = sode3vong
        self.stringUrl = stringUrl
    }
    
}