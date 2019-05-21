//
//  ResourcesFacade.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import PromiseKit


protocol ResInfoFacadeProtocol {
    
    func getResInfo(url:String) -> Promise<[ResInfoResponse]>
    
    
}
class ResInfoFacade: ResInfoFacadeProtocol {
    
    
    
    
    static let shared = ResInfoFacade()
    private init() {
        
    }
    
    
    func getResInfo(url:String) -> Promise<[ResInfoResponse]> {
        return ResInfoService.shared.getResInfo(url: url)
    }
    
    
}
