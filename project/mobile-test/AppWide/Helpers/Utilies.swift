//
//  Utilies.swift
//  agriBank
//
//  Created by Apple on 4/9/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit

class Utilies{
    public static func generateBillInfo(companyType:String,billId:String) ->( String, Int){
        //  var serviceIdentifier = billId.substring(billId.length() - 5, billId.length() - 2);
        var serviceIdentifier :String=""
        var sImage:String = ""
        var sColor : Int = 0
        if( companyType == "WA"){
            sImage = "wa"
            sColor = 1
            return (sImage,sColor)
        }else if(companyType == "EL"){
            sImage =  "el"
            sColor = 2
            return (sImage,sColor)
        }else if(companyType == "GA"){
            sImage =  "ga"
            sColor = 3
            return (sImage,sColor)
        }else if(companyType ==  "TC"){
            sImage =  "tc"
            sColor = 4
            return (sImage,sColor)
        }else if(companyType == "MC"){
            if(serviceIdentifier == "090"){
                sImage =  "mc090"
                sColor = 5
                return (sImage,sColor)
            }else if(serviceIdentifier == "935"){
                sImage = "mc921"
                sColor = 6
                return (sImage,sColor)
            }else if(serviceIdentifier ==  "921"){
                sImage =  "mc935"
                sColor = 7
                return (sImage,sColor)
            }else{
                sImage =  "mc090"
                sColor = 8
                return (sImage,sColor)
            }
            
        }else if(companyType == "MN"){
            sImage =  "mn"
            sColor = 9
            return (sImage,sColor)
        }else if(companyType == "UD"){
            sImage =  "info"
            sColor = 10
            return (sImage,sColor)
        }else if(companyType == "FZ"){
            sImage =  "info"
            sColor = 11
            return (sImage,sColor)
        }else if(companyType == "IC"){
            sImage =  "info"
            sColor = 12
            return (sImage,sColor)
        }else{
            sImage =  "info"
            sColor = 13
            return (sImage,sColor)
        }
        
    }
    
    
    public static func getSplitCardNumber(_ cardNum: String) -> String? {
        
        var cardnums = cardNum
        
        var index = cardnums.index(cardnums.startIndex, offsetBy: 4)
        cardnums.insert("-", at:index)
        index = cardnums.index(cardnums.startIndex, offsetBy: 9)
        cardnums.insert("-", at:index)
        index = cardnums.index(cardnums.startIndex, offsetBy: 14)
        cardnums.insert("-", at:index)
        //  cardnums.insert("-", at: String.Index("8"))
        //   cardnums.insert("-", at: String.Index("13"))
        
        return cardnums
        
        
    }
    public static func getArrSplitterByComma(fullStringValue:String)->[String] {
        let fullNameArr    = fullStringValue.characters.split{$0 == ","}.map(String.init)
        return fullNameArr
    }
    
    public static func trimData(_ num:String)->String{
        var index = ""
        if num.range(of:"****") != nil  {
            index = num
        } else {
            index=num.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
        }
        
        return index
    }
    
    public static func toDateFormat(_ cardNum: String) -> String? {
        
        var cardnums = cardNum.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if(cardNum.count > 4){
            var index = cardnums.index(cardnums.startIndex, offsetBy: 4)
            cardnums.insert("/", at:index)
        }
        if(cardNum.count > 7){
            var index = cardnums.index(cardnums.startIndex, offsetBy: 7)
            cardnums.insert("/", at:index)
        }
        
        return cardnums
    }
    
    public static func toAmountFormat(_ number: Int) -> String? {
        
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = NumberFormatter.Style.currency
        numberFormater.decimalSeparator = AllFormatStrings.CommaSeperator.rawValue
        numberFormater.groupingSize     = 3
        numberFormater.positiveFormat   = AllFormatStrings.RialsFormatSeperator.rawValue
        numberFormater.locale           = Locale.init(identifier : FARSI_LANGUAGE_KEY)
        if let priceFormat = numberFormater.string(from: NSNumber(integerLiteral:Int(number))) {
            return priceFormat
        }
        return nil
    }
    
    
    public static func readJSONFromFile(fileName: String) -> Any?
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json
    }

    
   
}
