//
//  AnalyticsManager.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 18.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

 import Foundation
import FirebaseAnalytics
 
class AnalyticsManager {
    private static let _instance =  AnalyticsManager()
    
    
    
    static var  Instance: AnalyticsManager{
        
        return _instance
    }
    
    private init(){
        
    }
    
    func  sendEventsForAllAnalytics(eventName: String,parameter: Dictionary<String,Any>?) {
        // this function will help you to provide  append
        // all analytics events in same place easily.
       
        Analytics.logEvent(eventName, parameters: parameter)
        
       
        
    }
 
    
    
}
