//
//  UILabelExtension.swift
//  agriBank
//
//  Created by Apple on 4/16/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class GradientLabel: UILabel {
    
    @IBInspectable var startColor: UIColor = UIColor.agriGreen
    @IBInspectable var middleColor: UIColor = UIColor.agriGreen
    @IBInspectable var endColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        
        let gradient = CAGradientLayer()
        
        let maskedView = UIView(frame: CGRect(x: 0, y: 0, width: superview!.frame.size.width, height: superview!.frame.size.height))
        gradient.frame = maskedView.bounds
        
        //let color1 = UIColor.clear.cgColor
        let color2 = UIColor.agriGreen.withAlphaComponent(0.5).cgColor
        // let color3 = UIColor.black.cgColor
        gradient.colors = [startColor,middleColor,endColor]
        //        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
        
    }
}
