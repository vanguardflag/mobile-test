//
//  CategoryResponse.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


class CategoryResponse:Codable{
    
    var _id: String?
    var updated_at: String?
    var slug: String
    var custom_module_eid: String?
    var eid: String?
    var title: String?
    var description: String?
    var __v :Int?
    var _active:Bool
    var creatd_at :String?

}
