//
//  Model.swift
//  DBO WIKI
//
//  Created by Kacper Kuźniak on 04/08/2017.
//  Copyright © 2017 Kacper Kuźniak. All rights reserved.
//

import Foundation

class CellModel {
    
    private var _img: String!
    private var _title: String!
    
    var img: String {
        return _img
    }
    
    var title: String {
        return _title
    }
    
    init(img: String, title: String) {
        _img = img
        _title = title
    }
}
