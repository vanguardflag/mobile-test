//
//  CardView.swift
//  agriBank
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutSubviews()
    }
    
    override func prepareForInterfaceBuilder() {
        layoutSubviews()
    }
    
    
    @IBInspectable var cornerRadiuse: CGFloat = 2
    
    @IBInspectable var shadowOffsetWidths: Int = 0
    @IBInspectable var shadowOffsetHeights: Int = 3
    
    
    @IBInspectable var shadowColors: UIColor? = UIColor.black{
        didSet{
            setBackground(color: backgroundColors!)
        }
    }
    
    @IBInspectable var shadowOpacitye: Float = 0.5{
        didSet{
            setShadowOpacity(shadowOpacity: shadowOpacitye)
        }
    }
    @IBInspectable var backgroundColors: CGColor? = UIColor.white.cgColor{
        didSet{
            setBackground(color: backgroundColors!)
        }
    }
    
    func setBackground(color:CGColor) {
        layoutSubviews(background: color)
    }
    
    func setShadowOpacity(shadowOpacity:Float) {
        layoutSubviews(shadowOpacity: shadowOpacity)
    }
    
    
    func setShadow(color:UIColor) {
        layoutSubviews(shadow: color.cgColor)
    }
    
    
    func layoutSubviews(background:CGColor) {
        layer.cornerRadius = cornerRadiuse
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiuse)
        layer.backgroundColor = backgroundColor?.cgColor
        layer.masksToBounds = false
        layer.backgroundColor = background
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidths, height: shadowOffsetHeights);
        layer.shadowOpacity = shadowOpacitye
        layer.shadowPath = shadowPath.cgPath
    }
    
    func layoutSubviews(shadow:CGColor) {
        layer.cornerRadius = cornerRadiuse
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiuse)
        layer.backgroundColor = backgroundColor?.cgColor
        layer.masksToBounds = false
        layer.backgroundColor = backgroundColors
        layer.shadowColor = shadow
        layer.shadowOffset = CGSize(width: shadowOffsetWidths, height: shadowOffsetHeights);
        layer.shadowOpacity = shadowOpacitye
        layer.shadowPath = shadowPath.cgPath
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadiuse
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiuse)
        layer.backgroundColor = backgroundColor?.cgColor
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidths, height: shadowOffsetHeights);
        layer.shadowOpacity = shadowOpacitye
        layer.shadowPath = shadowPath.cgPath
    }
    func layoutSubviews(shadowOpacity:Float) {
        layer.cornerRadius = cornerRadiuse
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiuse)
        layer.backgroundColor = backgroundColor?.cgColor
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidths, height: shadowOffsetHeights);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
