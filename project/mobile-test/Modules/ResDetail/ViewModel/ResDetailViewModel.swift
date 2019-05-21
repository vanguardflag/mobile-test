//
//  ResDetailViewModel.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//
import Foundation


protocol ResDetailViewModelType: ViewModelType  {
    var ResDetail : ResInfoModel! {get}
}

class ResDetailViewModel: ResDetailViewModelType {
    
    var ResDetail: ResInfoModel!
    weak var delegate: ViewModelDelegate?
    
    func initData() {
        
    }

    
    func fillData(resDetail:ResInfoModel) {
        ResDetail = resDetail
        delegate?.didLoadData()
    }
    
}
