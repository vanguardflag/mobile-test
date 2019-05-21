//
//  GeneralManager.swift
//  agriBank
//
//  Created by Apple on 3/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


class GeneralManager:NSObject {
    
    override  init() {
    }
    
    
    // create random user name
    func randomAlphanumericStringWithLength(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    
    func applySeperatorOnAccount(fullString: String)->[String] {
        let fullStringTemp = fullString
        let fullStringArr = fullStringTemp.split{$0 == ","}.map(String.init)
        return fullStringArr
    }
    
    
}
