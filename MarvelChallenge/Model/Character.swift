//
//  Character.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

 import UIKit
class Character {
    
            private var _name: String!
           private var _imageUrl: String!
           
    
           var name: String {
               return _name
           }
          
           var imageUrl: String {
                 return _imageUrl
             }
       
       
           
        
         
    init(name: String, imageUrl: String) {
                 _name = name
                 _imageUrl = imageUrl
               
       }
    
}
