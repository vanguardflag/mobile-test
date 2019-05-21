//
//  DateConvertor.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import Foundation

class DateConvertor {
    static let showDateFormat: String = "dd MMMM yyyy"
    static let showTimeFormat: String = "HH:mm"
    static let activityLogToday = "امروز"
    static let activityLogYesterday = "دیروز"
    
    static func convertToPersianString(withFormat format: String = "dd MMMM yyyy", date: Date) -> String {
       
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .persian)
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: "fa_IR")

        return dateFormatter.string(from: date)
    }
    
    static func showDateWithMonthNameFromMillis(millis: Int64, withFormat format: String = "dd MMMM yyyy") -> String {
        let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "fa_IR")

        return formatter.string(from: date)
    }
    static func showDateFromMillis(millis: Int) -> Date {
         let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        return date
    }
    static func showDateFromMillisWithoutTimezone(millis: Int) -> Date {
        let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")

        return formatter.date(from: formatter.string(from: date))!
    }

    static func startOfDayInMillis(date: Date) -> Int {
      //  var calendar = Calendar.current
       // calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
//        let startOfDay = calendar.startOfDay(for: date)
        return Int(date.timeIntervalSince1970 * 1000)
    }
    // (todo).(below functions are not being used yet)
    static func convertDateToSendToServer(date: Date) -> Int64 {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.timeZone = TimeZone(abbreviation: "IRDT")
        let stringDateinUTC = formatter.string(from: date)
        let dateUTC = formatter.date(from: stringDateinUTC)
        let intUTC = ((dateUTC?.timeIntervalSince1970) ?? 0) * 1000
        return Int64(intUTC)
    }
   static func tempFunctoConvertDateToTimeStamp(date: Date) -> Int64 {
        let timeInterval = Int64(date.timeIntervalSince1970)
        let dateInt = Int64(((timeInterval) + 16200) * 1000)
        return dateInt
    }
    static func showTime24(millis: Int64) -> String {
        let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    static func showDate(millis: Int64) -> String {
        let date = showDateWithMonthNameFromMillis(millis: millis)
        if date == todayDate() {
            return activityLogToday
        }
        else if date == yesterdayDate() {
            return activityLogYesterday
        }
        return date
    }
    static func todayDate() -> String {
        let date = Date().today
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = showDateFormat
        formatter.locale = Locale(identifier: "fa_IR")
        
        return formatter.string(from: date)
    }
    
    static func yesterdayDate() -> String {
        let date = Date().yesterday
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = showDateFormat
        formatter.locale = Locale(identifier: "fa_IR")
        
        return formatter.string(from: date)
    }
    
    
}
class Date2 {
    static let showDateFormat: String = "dd MMMM yyyy"
    static let showTimeFormat: String = "HH:mm"

    
    static func showDateWithMonthNameFromMillis(millis: Int) -> String {
        let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = showDateFormat
        formatter.locale = Locale(identifier: "fa_IR")
        
        return formatter.string(from: date)
    }
    
    static func showTime24(millis: Int) -> String {
        let date = Date(timeIntervalSince1970: (Double(millis) / 1000.0))
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = showTimeFormat
        
        return formatter.string(from: date)
    }
}

extension Date {
    var today: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
