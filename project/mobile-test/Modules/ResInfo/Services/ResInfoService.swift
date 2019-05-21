//
//  ResourcesService.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//


import Foundation
import PromiseKit

protocol ResInfoServiceProtocol {
    func getResInfo(url:String) -> Promise<[ResInfoResponse]>
}

class ResInfoService: DataManager, ResInfoServiceProtocol {
    static let shared = ResInfoService()
    
    func getResInfo(url:String) -> Promise<[ResInfoResponse]> {
        return networkManager.get(fromURL: url, parameters: nil).then{
            data in return try Promise(data: data)
        }
    }
    
}
