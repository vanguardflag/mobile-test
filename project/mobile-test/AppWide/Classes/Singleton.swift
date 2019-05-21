//
//  Singleton.swift
//  agriBank
//
//  Created by Apple on 3/17/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit


class Singleton: NSObject {
    
    // MARK: - Shared Instance
    
    private var apiManager         : HttpGateway?
  //  private var databaseManager    : DatabaseManager?
      private var alertViewManager   : AlertViewManager?
//    private var userDefaultManager : UserDefaultManager?
    private var generalManager     : GeneralManager?
//
//    private var memoryLoader       : MemoryLoader?
    
    private var deviceVendorId     : String?
    private var deviceAdvertiseId  : String?
    private var secretKey          : String?
    private var cellNumber         : String?
    
    
    
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        print("Singleton")
        return instance
    }()
    
    var appDelegate                : AppDelegate?{
        get{
            return UIApplication.shared.delegate as? AppDelegate
        }
    }
    // MARK: - Initialization Method
    
    
//    func getMemoryLoader() ->MemoryLoader {
//        if memoryLoader == nil {
//            memoryLoader = MemoryLoader()
//            return memoryLoader!
//        }
//        return memoryLoader!
//    }
//
    func getApiManager() -> HttpGateway {
        if apiManager == nil {
            apiManager = HttpGateway()
            return apiManager!
        }
        return apiManager!
    }
//
//    func getDatabaseManager() -> DatabaseManager {
//        if databaseManager == nil {
//            databaseManager = DatabaseManager()
//            return databaseManager!
//        }
//        return databaseManager!
//    }
    
    func getAlertViewManager() -> AlertViewManager {
        if alertViewManager == nil {
            alertViewManager = AlertViewManager()
            
            return alertViewManager!
        }
        return alertViewManager!
    }
    
    func getGeneralManager() -> GeneralManager {
        if generalManager == nil {
            generalManager = GeneralManager()
            return generalManager!
        }
        return generalManager!
    }
//    
//    func getUserDefaultManager() -> UserDefaultManager {
//        if userDefaultManager == nil {
//            
//            userDefaultManager = UserDefaultManager()
//            return self.userDefaultManager!
//            
//            
//            
//        }
//        return userDefaultManager!
//    }
    
    func getDeviceAdvertiseId() -> String {
        if deviceAdvertiseId == nil {
            if let deviceAdvertiseString =  UIDevice.current.identifierForVendor!.uuidString as? String {
                deviceAdvertiseId  = deviceAdvertiseString
            }
        }
        return deviceVendorId!
    }
    
    func getDeviceVendorId() -> String {
        if deviceVendorId == nil {
            if let deviceVendorString =  UIDevice.current.identifierForVendor!.uuidString as? String {
                deviceVendorId  = deviceVendorString
            }
        }
        return deviceVendorId!
    }
    
    
    
    
    
    func getCurrentTimeOffset()->String {
        let currentMillis = Int64(Date().timeIntervalSince1970)
        let dateStrOffset = getTimeOffset()
        return "\(Int64(currentMillis))"+dateStrOffset
    }
    
    
    private func getTimeOffset()->String {
        
        if self.isItInFirstHalfPersianYear() == true {
            return ";+16200"
        }
        return ";+12,600"
        
        
        /*NSArray *timeData = [serverTimeMessage componentsSeparatedByString:@";"];
         
         NSString *serverDateString = [timeData objectAtIndex:0];
         NSDate *serverDate= [NSDate dateWithTimeIntervalSince1970:[serverDateString longLongValue]];
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
         [dateFormatter setTimeZone:timeZone];
         [dateFormatter setDateFormat:LI_SERVERTIME_TIMEFORMAT];
         NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
         NSDate *currentTimeGMT= [dateFormatter dateFromString:dateString];
         float dateDiffrence = [serverDate timeIntervalSinceDate:currentTimeGMT];
         
         NSString *timeDiffValid = [timeData objectAtIndex:1];
         NSDate *invalidDate= [NSDate dateWithTimeIntervalSinceNow:[timeDiffValid floatValue]];
         NSDateFormatter *newDateFormmater = [[NSDateFormatter alloc]init];
         [newDateFormmater setDateFormat:LI_SERVERTIME_TIMEFORMAT];
         NSString *ivalideDateString = [newDateFormmater stringFromDate:invalidDate];
         
         [BRTimeRepository saveServerTimeDiffrence:[NSString stringWithFormat:@"%f",dateDiffrence]];
         [BRTimeRepository saveInvalidDiffrenceGap:ivalideDateString];*/
        
        
    }
    
    
    
    func isItInFirstHalfPersianYear()-> Bool {
        
        let date = Date()
        let calendar = Calendar(identifier: Calendar.Identifier.persian)
        let components = (calendar as NSCalendar).components(.day, from: date)
        let days = components.day
        if  days! < 186 {
            return true
        }
        return false
        
    }
    
    
    
    override init() {
        super.init()
    }
    
    func makeBackButtonTitleEmpty()-> UIBarButtonItem
    {
        let backItem = UIBarButtonItem()
        backItem.title = " "
        return backItem
    }
    
    func setSecretKey(sKey : String) {
        self.secretKey = sKey// AES256CBC.generatePassword()
    }
    
    func getSecretKey()-> String {
        if let secretKeyTemp = self.secretKey {
            return secretKeyTemp
        }
        return ""
    }
    
    func setCellNumber(cell : String) {
        self.cellNumber = cell
    }
    
    func getCellNumber()-> String {
        if let cellNumberTemp = self.cellNumber {
            return cellNumberTemp
        }
        return ""
    }
    
    
    
}

