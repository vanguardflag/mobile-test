//
//  GoToURL.swift
//  mobile-test
//
//  Created by Apple on 5/21/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


class GoToURL {
    public static func sendEmail(emailAddress: String) {
        openSafeURL(url: "mailto:" + emailAddress )
    }
    
     public static func sendSMS(number: String) {
        openSafeURL(url: "sms:" + number )
    }
    
     public static func makeCall(number: String, prompt: Bool) {
        openSafeURL(url: "tel" + (prompt ? "prompt:" : ":") + number)
    }
    
     public static func openWebsite(urlAddress:String){
         openSafeURL(url: urlAddress)
    }
    
     private static func openSafeURL(url: String) {
            if let urlSet = URL(string: url){
                if UIApplication.shared.canOpenURL(urlSet){
                    UIApplication.shared.open(urlSet, options: [:], completionHandler: nil)
                }
            } else {
              
            }
        
    }
    
    public static func openMaps(address:String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarksOptional, error) -> Void in
            if let placemarks = placemarksOptional {
                if let location = placemarks.first?.location {
                    let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
                    let path = "http://maps.apple.com/" + query
                    openSafeURL(url: path)
                } else {
                }
            } else {
            }
        }
    }
    
    public static func openMapsBaseLatLng(lat:String,lng:String){
        let query = "?ll=\(lat),\(lng)"
        let path = "http://maps.apple.com/" + query
        openSafeURL(url: path)
    }
}
