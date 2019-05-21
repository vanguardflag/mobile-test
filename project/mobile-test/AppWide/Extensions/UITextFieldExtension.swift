//
//  UITextFieldExtension.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import UIKit

extension UITextField {
    func checkKeyboardLanguage() -> (Bool, String) {
        
        if let language = self.textInputMode?.primaryLanguage, language.contains("en") || language.contains("fa") || language.contains("ar") {
            return (true, "")
        } else {
            return (false, "لطفا زبان کیبورد را به انگلیسی تغییر دهید.")
        }
        
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        if(!GlobalVar.shared.isRTL){
            self.textAlignment = NSTextAlignment.left ;
            self.semanticContentAttribute = UISemanticContentAttribute.forceLeftToRight ;
        }
        else{
            self.textAlignment = NSTextAlignment.right;
            self.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft;
        }
    }
    
    
    func isNull() -> Bool {
        if(self.text == "" || self.text == nil){
            return true
        }else{
            return false
        }
    }
    
    func  isLengthOk(length:Int) -> (Bool,Int) {
        if !self.isNull() {
            if (self.text?.count)! < length {
                return (false,(self.text?.count)!)
            }else{
                return (true,(self.text?.count)!)
            }
        }else{
            return (false,0)
        }
        
    }
   
}
