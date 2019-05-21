//
//  GlobalVar.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/23/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import Foundation
import CoreTelephony
class GlobalVar {
    static let shared = GlobalVar()
    var isRTL: Bool = true
    var isCompany: Bool = false {
        didSet {
            if isCompany {
                self.role = "Company"
            }else {
                self.role = "Candidate"
            }
        }
    }
    var lng: String
    var role : String = "Candidate"
    public func setIsRTL (isRTL : Bool){
        self.isRTL = isRTL
    }
    public func setIsCompany (isCompany: Bool){
        self.isCompany = isCompany
    }
    public func setLng (lng: String){
        self.lng = lng
    }
    
    private init() {
        self.lng = (UserDefaults.standard.value(forKey: "lproj") as? Array ?? ["en"]).first ?? "en"
        if self.lng != "fa" {
            self.isRTL = false
        }
//        if self.lng != "en" || self.lng != "fa" || self.lng != "fr" {
//            self.lng = "fa"
//            UserDefaults.standard.set(["fa"], forKey: "lproj")
//            UserDefaults.standard.synchronize()
//        }
    }
}
