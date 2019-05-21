//
//  ContactInfoResponse.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


class ContactInfoResponse: Codable {
    var website : [String]?
    var email : [String]?
    var phoneNumber : [String]?
    var faxNumber : [String]?
    var tollFree : [String]?
}
