//
//  ConstantStrings.swift
//  AnanasJob
//
//  Created by Zamzam Pooya on 12/23/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import Foundation


enum ConstantStrings: String {
    case forgotPassword = "forgotPassword"
    case login = "login"
    
    
    var localized: String {
        return self.rawValue.localized()
    }
}


enum ResInfo: String {
    case restaurants = "restaurants"
    case vacationSpots = "vacation-spots"
}

enum DaysOfWeek:String{
    case saturday = "Saturday"
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
}
enum AllJsonKeys: String {
    case deviceIdentifier  = "de"
    case mobileNumber      = "mo"
    case operationCode     = "op"
    case transactionId     = "tr"
    case applicationId     = "ap"
    case applicationToken1 = "a1"
    case applicationToken2 = "a2"
    case requestTimeInfo   = "te"
    case sessionId         = "se"
    case applicationInfo   = "av"
    case extraData         = "ed"
    case advertisement     = "ad"
    case state             = "st"
    case description       = "ds"
    case securityCode      = "sc"
    case serverTime        = "sm"
    case sourceAccountNumber = "sn"
    case pin = "nn"
    case destinationAccountNumber = "tn"
    case amount = "ao"
}


enum AllFormatStrings : String {
    case TumansFormat          = "#,### تومان"
    case CommaSeperator        = ","
    case UnderlineSeperator        = "-"
    case RialsFormatSeperator  = "#,###"
    case CardFormatSeperator  = "#-####"
    case UTC_Format            = "UTC"
    case DefaultStringDateFormat = "yyyy-MM-dd"
    case StringDateFormat = "yyyy/MM/dd"
}

let FARSI_LANGUAGE_KEY            = "fa_IR"
let ENGLISH_LANGUAGE_KEY            = "en_US"




