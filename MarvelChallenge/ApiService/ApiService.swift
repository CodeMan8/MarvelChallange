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
    case serviceCode
    case latestCode
}
class ApiService {
   static var delegate: ApiServiceDelegate?
    
   static  func getCasesForHead() {
    
    let LAST_URL = Constants.API + Constants.characters + Constants.apiKey
  //  let params = ["apikey": "d3df83bf5d2fc22cf26d94615abfd7ef"]
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
    /*
    static  func getCasesForService() {
     
             let LAST_URL = Constants.API + Constants.apiEndPointService
                print(LAST_URL)
             Alamofire.request(LAST_URL).responseArray { (response: DataResponse<[Trending]>) in
                 
                 if response.error != nil {
                    delegate?.onFailure(response.error, .errorState)
                     
                     
                 } else {
                     let AllResponse = response.result.value
                    delegate?.onSuccess(AllResponse, .serviceCode)

                 }
                
            }
       
         }
    static  func getCasesForLatest() {
     
             let LAST_URL = Constants.API + Constants.apiEndPointHome
             Alamofire.request(LAST_URL).responseObject { (response: DataResponse<ArmutService>) in
                 
                 if response.error != nil {
                    delegate?.onFailure(response.error, .errorState)
                     
                     
                 } else {
                     let AllResponse = response.result.value
                    delegate?.onSuccess(AllResponse, .latestCode)

                 }
                
            }

       */
         }
    
    

