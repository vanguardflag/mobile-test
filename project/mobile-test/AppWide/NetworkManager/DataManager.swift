//
//  DataManager.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//


import UIKit
import Alamofire

class DataManager {
    static let share = DataManager()
    let networkManager = HttpGateway()
}
