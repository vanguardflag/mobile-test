//
//  StringHelper.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018 . All rights reserved.
//

import Foundation

class StringHelper {
    static func convertToEnglishDigits(input: String?) -> String {// convert persian and arabic nums to english
        let numbersDictionary : Dictionary = ["۰":"0", "۱":"1", "۲":"2", "۳":"3", "۴":"4", "۵":"5", "۶":"6", "۷":"7", "۸":"8", "۹":"9", "٠":"0", "١":"1", "٢":"2", "٣":"3", "٤":"4", "٥":"5", "٦":"6", "٧":"7", "٨":"8", "٩":"9"]
        if let inputFinal = input {
            var output = inputFinal
            for (key, value) in numbersDictionary {
                output = output.replacingOccurrences(of: key, with: value)
            }
            return output
        }
        return ""
    }
    
    static func convertToPersianDigits(input: String?) -> String {// convert english and arabic nums to persian
        let numbersDictionary : Dictionary = ["0":"۰","1":"۱", "2":"۲", "3":"۳", "4":"۴", "5":"۵", "6":"۶", "7":"۷", "8":"۸", "9":"۹", "٠":"۰","١":"۱", "٢":"۲", "٣":"۳", "٤":"۴", "٥":"۵", "٦":"۶", "٧":"۷", "٨":"۸", "٩":"۹"]
        if let inputFinal = input {
            var output = inputFinal
            for (key, value) in numbersDictionary {
                output = output.replacingOccurrences(of: key, with: value)
            }
            return output
        }
        return ""
    }
    
    static func replaceArabicDigits(string: String) -> String {
        var str = string
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    static func replaceFuncArabic(string: String) -> String{
        let NumberStr: String = string
        let Formatter: NumberFormatter = NumberFormatter()
        Formatter.locale = Locale(identifier: "EN")
        let final = Formatter.number(from: NumberStr)
        return final?.stringValue ?? ""
    }
    
    static func doMasking(_ numbers: String) -> String? {
        
        let _: String = "٣٤٨٦٩١٢٨٨١"
        
        var number = convertToEnglishDigits(input: numbers)
        
        let nums=number.prefix(3) + "****" + number.suffix( Int(number.count) - 2)
        
        return String(nums)
    }
    
    static func doMaskingTel(_ number: String) -> String? {
        
        let _: String = "09124255914"
        
        
        let nums=number.prefix(4) + "***" + number.suffix(Int(number.count)-4)
        
        return String(nums)
    }
    
    static func doMaskingCard(_ number: String) -> String? {
        
        let _: String = "٣٤٨٦٩١٢٨٨١"
        
        let nums=number.prefix(7) + "****" + number.suffix(Int(number.count)-5)
        
        return String(nums)
    }
    
    public static func getTimeFromMilisecond( mili:String)->String{
        //let d = Date()
        let dateFormatter = DateFormatter()
        let ms = Double(mili.components(separatedBy: ";")[0])!
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        let dateInGrogrian = dateFormatter.date(from: String(describing: Date(timeIntervalSince1970: ms)))
        let calender = NSCalendar(calendarIdentifier: NSCalendar.Identifier.persian)
        let components = calender?.components(NSCalendar.Unit(rawValue: UInt.max), from: Date(timeIntervalSince1970: ms))
        let year =  components!.year
        let month = components!.month
        
        let day = components!.day
        let hour = components?.hour
        let minute = components?.minute
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        let datePersian = "\(String(describing: year!))/\(String(describing: month!))/\(String(describing: day!)) - \(String(describing: hour!)):\(String(describing: minute!))"
        
        
        
        return datePersian
    }
    
    public static func removeSpace(text : String)-> String {
        var str:String = ""
        var texts = text.split(separator: " ")
        
        for item in texts {
            str = str + " " + String(item)
        }
        return str
    }
}
