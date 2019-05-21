//
//  UIImageExtension.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import UIKit
extension UIImage
{
    var highestQualityJPEGNSData: Data { return jpegData(compressionQuality: 1.0)!}
    var highQualityJPEGNSData: Data    { return jpegData(compressionQuality: 0.75)!}
    var mediumQualityJPEGNSData: Data  { return jpegData(compressionQuality: 0.5)!}
    var lowQualityJPEGNSData: Data     { return jpegData(compressionQuality: 0.25)!}
    var lowestQualityJPEGNSData: Data  { return jpegData(compressionQuality: 0.01)!}
}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
