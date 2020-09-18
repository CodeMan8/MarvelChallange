//
//  Character.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
class Character {
    private var _id: Int!
    private var _name: String!
    private var _imageUrl: String!
    private var _description: String?
    private var _comics: [String?]
    
    
    var id: Int {
        return _id
    }
    var name: String {
        return _name
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    
    var comics: [String?] {
        return _comics
    }
    var description: String? {
        return _description
    }
    
    
    
    init(id: Int,name: String, imageUrl: String, description: String?, comics: [String?]) {
        _id = id
        _name = name
        _imageUrl = imageUrl
        _description = description
        _comics = comics
    }
    
    
    
}
