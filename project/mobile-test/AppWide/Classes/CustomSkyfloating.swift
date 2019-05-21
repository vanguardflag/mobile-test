//
//  CustomSkyfloating.swift
//
//  Created by Jalal Najafi .
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class CustomSkyfloating: SkyFloatingLabelTextField {
    
    func mobileValidation() -> (Bool, String) {
       
       self.text = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (self.text?.count ?? 0) < 1 {
            return (false, "لطفا شماره‌موبایل خود را وارد کنید")
        } else if (self.text?.count ?? 0) == 11 {
            return (true, "")
        } else {
            return (false, "شماره‌موبایل وارد شده صحیح نمی باشد")
        }
    }
    
    func passWordValidation() -> (Bool, String) {
        self.text = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (self.text?.count ?? 0) < 1 {
            return (false, "لطفا رمزعبور خود را وارد کنید")
        } else if (self.text?.count ?? 0) < 4 {
            return (false, "رمزعبور باید بیشتر از ۴ حرف باشد")
        } else {
            return (true, "")
        }
    }
    func isEmptyValidation() -> (Bool, String) {
        self.text = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (self.text?.count ?? 0) < 1 {
            return (false, "لطفا رمزعبور خود را وارد کنید")
        } else {
            return (true, "")
        }
    }
    func isEmptyValidation(textFieldname: String) -> (Bool, String) {
        self.text = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (self.text?.count ?? 0) < 1 {
            return (false, "لطفا \(textFieldname) را وارد کنید.")
        } else {
            return (true, "")
        }
    }
    
}
