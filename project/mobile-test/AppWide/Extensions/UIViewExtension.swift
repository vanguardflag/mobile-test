//
//  UIViewExtension.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    

    
    @IBInspectable
    var isShouldRasterize : Bool{
        get{
            return layer.shouldRasterize
        }
        set{
            layer.shouldRasterize = isShouldRasterize
        }
    }
    

    @IBInspectable
    var rasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = rasterizationScale
        }
    }
    
    
//    @IBInspectable
//    var isShadowPath : Bool{
//        get{
//            return true
//        }
//        set{
//            if isShadowPath {
//                self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//            }
//        }
//        
//    }
    
    @IBInspectable
    var isMasksToBounds : Bool{
        get{
            return layer.masksToBounds
        }
        set{
            layer.masksToBounds = isMasksToBounds
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
//    @IBInspectable
//    var shadowOffset: CGSize {
//        get {
//            return layer.shadowOffset
//        }
//        set {
//            layer.shadowOffset = newValue
//        }
//    }
    
    
    @IBInspectable var shadowOffsetWidth: CGFloat {
        get{
            return (layer.shadowOffset.width)
        }
        set{
            layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        }
    }
    @IBInspectable var shadowOffsetHeight: CGFloat {
        get{
            return (layer.shadowOffset.height)
        }
        set{
            layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
}

extension UIView {
    func showLoading() {
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView()
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    private func createLoadingViewWithBackground(with activityIndicator: UIActivityIndicatorView) {
        let loadingView = UIView(frame: self.bounds)
        loadingView.tag = 100
        loadingView.layer.cornerRadius = self.layer.cornerRadius
        loadingView.backgroundColor = UIColor.agriSnow
        self.addSubview(loadingView)
        customizeActivityIndicator(with: activityIndicator,
                                   on: loadingView)
    }
    func showLoadingWithBackground() {
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView()
        createLoadingViewWithBackground(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        if let loadingView = self.viewWithTag(100) {
            loadingView.removeFromSuperview()
        }
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        let loadingView = UIView(frame: self.bounds)
        loadingView.tag = 100
        loadingView.layer.cornerRadius = self.layer.cornerRadius
        loadingView.backgroundColor = self.backgroundColor == nil ?
            .white : self.backgroundColor
        self.addSubview(loadingView)
        customizeActivityIndicator(with: activityIndicator,
                                   on: loadingView)
    }
    
    private func customizeActivityIndicator(with activityIndicator: UIActivityIndicatorView,
                                            on loadingView: UIView) {
        activityIndicator.hidesWhenStopped = true
        if let loadingViewBackgroundColor = loadingView.backgroundColor {
            activityIndicator.color = loadingViewBackgroundColor.isLight ? .darkGray : .white
        } else {
            activityIndicator.color = UIColor.darkGray
        }
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(activityIndicator)
        center(activityIndicator, on: loadingView)
    }
    
    private func center(_ activityIndicator: UIActivityIndicatorView, on loadingView: UIView) {
        let xCenterConstraint = NSLayoutConstraint(item: loadingView,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: loadingView,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    
    func setGradient(){
        
        let gradient = CAGradientLayer()
        
        let maskedView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        gradient.frame = maskedView.bounds
        
        let color1 = UIColor.white.cgColor
        let color2 = UIColor.agriGreen.withAlphaComponent(0.3).cgColor
        let color3 = UIColor.white.cgColor
        gradient.colors = [color1,color2,color3]
        //        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }

    
}
extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.65
    }
    
}

extension UIView {
    
    func dropShadow(color: UIColor = UIColor.lightGray, opacity: Float = 0.5, offSet: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 5, scale: Bool = false) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = false
        //self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}


