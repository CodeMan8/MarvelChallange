//
//  CharacterObject.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import Foundation
import ObjectMapper

class CharacterObject: Mappable {
    
    
    var data: Data?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        data <- map["data"]
        
        
    }
}
class Data: Mappable {
    var results: [Results]?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        results <- map["results"]
        
        
    }
    
    
}



class Results: Mappable {
    var id: Int!
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    var comics: Comics?
    var comicTitle: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        comics <- map["comics"]
        comicTitle <- map["title"]
        
        
        
        
    }
    
    
}
class Thumbnail: Mappable {
    var path: String?
    var _extension: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        path <- map["path"]
        _extension <- map["extension"]
        
        
    }
}
class Comics: Mappable {
    var items: [Items]?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        
        
    }
}

class Items: Mappable {
    var comicName: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        comicName <- map["name"]
        
        
    }
}




