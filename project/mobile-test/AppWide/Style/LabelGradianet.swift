//
//  LabelGradianet.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//


import Foundation
import UIKit


@IBDesignable
class LabelGradianet: UILabel {
    
    @IBInspectable var FirstColor:UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor:UIColor = UIColor.black.withAlphaComponent(0.5){
        didSet{
            updateView()
        }
    }
    @IBInspectable var SecondColorAlpha:CGFloat = (0.5){
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var ThirdColor:UIColor = UIColor.black{
        didSet{
            updateView()
        }
    }
    
    override class var layerClass:AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    
    
    func updateView(){
        
        let layer = self.layer as! CAGradientLayer
        
        
        layer.colors = [FirstColor.cgColor,SecondColor.withAlphaComponent(SecondColorAlpha).cgColor,ThirdColor.cgColor]
        //        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        
    }
}

