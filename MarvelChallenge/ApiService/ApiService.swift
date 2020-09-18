//
//  ApiService.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
protocol  ApiServiceDelegate {
    func onSuccess(_ response: Any?, _ requestCode: RequestCode)
    func onFailure(_ error: Error?, _ requestCode: RequestCode)
    
}
enum RequestCode {
    case getAllCases
    case errorState
    case NextCase
}
class ApiService {
    static var delegate: ApiServiceDelegate?
    
    static  func getCharacters() {
        
        let LAST_URL = Constants.API + Constants.characters + Constants.apiKey
        let params = ["limit": 30,"ts" : 1,"hash": "c698c665b792dab6a766465f579d640d"] as [String : Any]
        
        Alamofire.request(LAST_URL, method: .get, parameters: params).responseObject { (response: DataResponse<CharacterObject>) in
            
            if response.error != nil {
                delegate?.onFailure(response.error, .errorState)
                
                
            } else {
                let AllResponse = response.result.value
                delegate?.onSuccess(AllResponse, .getAllCases)
                
            }
            
        }
        
        
    }
    static  func getNextCharacters(nextValue: Int) {
        // this function will be used with offsetValue
        
        let LAST_URL = Constants.API + Constants.characters + Constants.apiKey
        let params = ["offset": nextValue,"limit": 30,"ts" : 1,"hash": "c698c665b792dab6a766465f579d640d"] as [String : Any]
        
        Alamofire.request(LAST_URL, method: .get, parameters: params).responseObject { (response: DataResponse<CharacterObject>) in
            
            
            if response.error != nil {
                delegate?.onFailure(response.error, .errorState)
                
                
            } else {
                let AllResponse = response.result.value
                delegate?.onSuccess(AllResponse, .getAllCases)
                
            }
            
        }
        
        
    }
    
    static  func getComicsDetail(withCharacterId: Int,sendingDate: String) {
        // this function will be used with offsetValue
        
        let LAST_URL = Constants.API + Constants.characters + "/\(withCharacterId)" +  Constants.comics  + Constants.apiKey
        let params = ["dateRange": sendingDate, "orderBy": "-onsaleDate","limit": 10,"ts" : 1,"hash": "c698c665b792dab6a766465f579d640d"] as [String : Any]
        
        Alamofire.request(LAST_URL, method: .get, parameters: params).responseObject { (response: DataResponse<CharacterObject>) in
            
            if response.error != nil {
                delegate?.onFailure(response.error, .errorState)
                
                
            } else {
                let AllResponse = response.result.value
                delegate?.onSuccess(AllResponse, .NextCase)
                
            }
            
        }
        
        
    }
    
    
}



