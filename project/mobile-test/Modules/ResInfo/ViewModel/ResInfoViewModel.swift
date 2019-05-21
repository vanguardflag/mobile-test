//
//  ResourcesViewModel.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


protocol ResInfoViewModelType: ViewModelType  {
    var ResInfoList :[ ResInfoModel]{get}
}

class ResInfoViewModel: ResInfoViewModelType {
   
    
    var ResInfoList: [ResInfoModel] = []
    
    weak var delegate: ViewModelDelegate?
    
    func initData() {
       
    }
    
    func getData(selectedItem: String?) {
        
        guard let SI = selectedItem else { return }
        
        switch SI {
        case ResInfo.restaurants.rawValue:
           getResInfo(value: ResInfo.restaurants.rawValue)
        case ResInfo.vacationSpots.rawValue:
           
            getResInfo(value: "vacation-spot")
        default:
            break
        }
    }
    
    
    private func getResInfo(value:String) {
        delegate?.willLoadData()
        ResInfoFacade.shared.getResInfo(url: value+".json").then(on: DispatchQueue.main) { (response) -> Void in
            
            if response.count != 0{
                print(response)
                self.ResInfoList = response.map({ResInfoModel(resInf: $0)})
                self.delegate?.didLoadData()
            }else{
                print(response)
                
            }
            
            
        }
        
        
    }
    
    
  
    

    
}
