//
//  CategoryService.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

//categories.json


import Foundation
import PromiseKit

protocol CategoryServiceProtocol {
    func getCategories() -> Promise<[CategoryResponse]>
}

class CategoryService: DataManager, CategoryServiceProtocol {
    static let shared = CategoryService()
    
    func getCategories() -> Promise<[CategoryResponse]> {
        return networkManager.get(fromURL: "categories.json", parameters: nil).then{
            data in return try Promise(data: data)
        }
    }
    
}
