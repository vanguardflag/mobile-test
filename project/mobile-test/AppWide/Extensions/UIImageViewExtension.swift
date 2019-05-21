//
//  UIImageViewExtension.swift
//  agriBank
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setTint() {
        self.image     = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = UIColor.agriGreen
    }
    
}
