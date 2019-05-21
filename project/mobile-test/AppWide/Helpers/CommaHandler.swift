//
//  CommaHandler.swift
//   
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import Foundation

class CommaHandler {
    static func commaHandling(value: Int64) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    static func commaHandling(value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    static func commaHandlingProperty(value: Int) -> String {
        var tempValue:Double = Double(value)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        if value > 1000000 {
            tempValue /= 1000000
              return (formatter.string(from: NSNumber(value: tempValue)) ?? "") + " " + "میلیون تومان"
        } else {
            return (formatter.string(from: NSNumber(value: tempValue)) ?? "") + " " + "تومان"
        }
      
    }
}
