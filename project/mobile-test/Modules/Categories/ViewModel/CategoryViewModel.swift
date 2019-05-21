//
//  CategoryViewModel.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation

protocol CategoryViewModelType: ViewModelType  {
    var Categories :[(Title:String,Data: CategoryModel)]{get}
}

class CategoriesViewModel: CategoryViewModelType {
    var Categories: [(Title:String,Data: CategoryModel)] = []
   
    weak var delegate: ViewModelDelegate?
    
    func initData() {
        getCategories()
    }
    
    
    
   
    
    
    private func getCategories() {
        delegate?.willLoadData()
        CategoryFacade.shared.getCategories().then(on: DispatchQueue.main) { (response) -> Void in
         
            if response.count != 0{
                let Cat = response.map({CategoryModel(cat: $0)})
                self.Categories = Cat
                    .sorted(by: {$0.slug < $1.slug}).map({($0.slug, $0)})
                self.delegate?.didLoadData()
            }
            
            
        }
            
            
    }
            

}
