//
//  CategoryFacade.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import PromiseKit


protocol CategoryFacadeProtocol {
    
    func getCategories() -> Promise<[CategoryResponse]>
    
    
}
class CategoryFacade: CategoryFacadeProtocol {
    
    
    
    
    static let shared = CategoryFacade()
    private init() {

    }
    
    
    func getCategories() -> Promise<[CategoryResponse]> {
        return CategoryService.shared.getCategories()
    }
    
    
}
