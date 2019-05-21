//
//  AddressResponse.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


class AddressResponse: Codable {
    var address1 : String?
    var label : String?
    var zipCode : String?
    var city : String?
    var state : String?
    var country : String?
    var gps : GPSResponse?
}

