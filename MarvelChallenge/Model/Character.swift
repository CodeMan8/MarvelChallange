//
//  Character.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
struct Character {
     var id: Int!
     var name: String!
     var imageUrl: String!
     var description: String?
     var comics: [String?]
    
 
    
    
    
    init(id: Int,name: String, imageUrl: String, description: String?, comics: [String?]) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.comics = comics
    }
    
    
    
}
