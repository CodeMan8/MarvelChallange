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
    var name: String?
    var thumbnail: Thumbnail?
    
    required init?(map: Map) {
         
    }
    
     func mapping(map: Map) {
        
        name <- map["name"]
        thumbnail <- map["thumbnail"]
        
 

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

 
