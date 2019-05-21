//
//  ImageWrapper.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    func setImage(urlString: String?, placeholder: UIImage? = #imageLiteral(resourceName: "housePlaceholder"), completionHandler: ((Bool) -> ())? = nil) {
        if let urlString = urlString {
            let url = URL(string: urlString)
           // self.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
            self.sd_setImage(with: url, placeholderImage: placeholder, options: .progressiveDownload, progress: nil) { (_, _, _, _) in
                completionHandler?(true)

            }
//            self.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: nil) { (_, _, _, _) in
//                completionHandler?(true)
//            }
        } else {
            self.image = placeholder
        }
    }
}
