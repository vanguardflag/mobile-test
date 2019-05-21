//
//  StringExtension.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/23/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        let path = Bundle.main.path(forResource: GlobalVar.shared.lng, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: tableName,bundle: bundle!, value: "**\(self)**", comment: "")
    }
    
    func numLocalized() -> String {
        
        let lng = (UserDefaults.standard.value(forKey: "lproj") as? Array ?? ["fa"]).first ?? "fa"
        if (lng == "fa"){
            return StringHelper.convertToPersianDigits(input: self)
            
        }else{
            return StringHelper.convertToEnglishDigits(input: self)
        }
      //  return self
    }
    
    public var removeHTMLTags: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        return attributedString.string
    }
}

