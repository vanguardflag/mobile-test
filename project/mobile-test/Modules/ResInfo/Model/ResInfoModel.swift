//
//  ResourcesModel.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


struct ResInfoModel {
    
    
    var id: String
    var slug: String
    var title: String
    var description: String
    var photo : String?
    var addresses : [AddressResponse?]?
    var contactInfo : ContactInfoResponse?
    var freeText : [[String:String]?]?
    var socialMedia : SocialMediaResponse?
    var bizHours : BizHoursResponse?
    
   
 

    
    
    
    
    init(resInf: ResInfoResponse) {
        id = resInf._id ?? ""
        slug = resInf.slug!
        title = resInf.title ?? ""
        description = resInf.description ?? ""
        photo = resInf.photo ?? ""
        addresses = resInf.addresses ?? []
        contactInfo = resInf.contactInfo ?? nil
        freeText = resInf.freeText ?? nil
        socialMedia = resInf.socialMedia ?? nil
        bizHours = resInf.bizHours ?? nil
       
    }
    
}
