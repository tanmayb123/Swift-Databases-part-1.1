//
//  SwiftyNetworking.swift
//  Database
//
//  Created by Tanmay Bakshi on 2015-07-13.
//  Copyright (c) 2015 Travis Barnett. All rights reserved.
//

import Foundation

var request = TBSDB()

class TBSDB {
    
    var url: String!
    
    init() {
        url = ""
    }
    
    init(initWithURL: String) {
        url = initWithURL
    }
    
    func getData() -> NSData? {
        
        return NSData(contentsOfURL: NSURL(string: url)!)
        
    }
    
    func dictionaryValue() -> [String: AnyObject] {
        
        if let data = getData() {
            
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! [String: AnyObject]
            } catch {
                print(error)
                return [:]
            }
            
        }
        
        return [String: AnyObject]()
        
    }
    
    func arrayValue() -> [AnyObject] {
        
        if let data = getData() {
            
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! [AnyObject]
            } catch {
                print(error)
                return []
            }
            
        }
        
        return [AnyObject]()
        
    }
    
}