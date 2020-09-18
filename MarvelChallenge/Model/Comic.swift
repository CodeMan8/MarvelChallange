//
//  Comic.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 18.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import Foundation

class Comic {
    
    private var _name: String!
    
    var name: String {
        
        return _name
        
    }
    
    init(name: String) {
        _name = name
        
    }
    
}
