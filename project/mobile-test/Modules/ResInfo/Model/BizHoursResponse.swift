//
//  BizHoursResponse.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


class BizHoursResponse: Codable {
    
    var sunday: WorkDayTimeResponse?
    var monday: WorkDayTimeResponse?
    var tuesday: WorkDayTimeResponse?
    var wednesday: WorkDayTimeResponse?
    var thursday: WorkDayTimeResponse?
    var friday: WorkDayTimeResponse?
    var saturday: WorkDayTimeResponse?
}
