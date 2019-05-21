//
//  ResourcesResponse.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation



class ResInfoResponse:Decodable{
    
    
    var _id : String?
    var slug : String?
    var eid : String?
    var title : String?
    var description : String?
    var category_eid : String?
    var __v : Int?
    var photo : String?
    var _active : Bool?
    var updated_at : String?
    var created_at : String?
    var addresses : [AddressResponse]?
    var contactInfo : ContactInfoResponse?
    var freeText : [[String:String]?]? = nil
    var socialMedia : SocialMediaResponse?
    var bizHours : BizHoursResponse?
    
    
    
}


