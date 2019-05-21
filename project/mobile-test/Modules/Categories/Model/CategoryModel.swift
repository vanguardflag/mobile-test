//
//  CategoryModel.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation

struct CategoryModel {
    
    
    var id: String
    var slug: String
    var title: String
    var description: String

    
    
    
    init(cat: CategoryResponse) {
        id = cat._id ?? ""
        slug = cat.slug 
        title = cat.title ?? ""
        description = cat.description ?? ""
    }
    
}
