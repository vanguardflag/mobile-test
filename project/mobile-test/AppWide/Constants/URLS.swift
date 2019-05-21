//
//  URLS.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import Foundation

class URLs {
    struct Registration {
        
        static let base = "Frameworks.Security.Controllers/Account"
        static let checkAccountExist = URLs.Registration.base + "/CheckAccountExistence_NativeApp"
        static let checkVerification = URLs.Registration.base + "/CheckVerificationCode_NativeApp"
        static let resendVerification = URLs.Registration.base + "/ResendVerificationCode_NativeApp"
        static let forgetCheckVerification = URLs.Registration.base + "/ForgetPassword_" + "CheckVerificationCode_NativeApp"
        static let forgetResendVerification = URLs.Registration.base + "/ForgetPassword_" + "ResendVerificationCode_NativeApp"
        static let forgetSendVerification = URLs.Registration.base + "/ForgetPassword_SendVerificationCode_NativeApp"
        static let updatePassword = URLs.Registration.base + "/UpdatePassword_NativeApp"
        static let login = URLs.Registration.base + "/SignIn_NativeApp"
        static let signUp = URLs.Registration.base + "/SignUp_Candidate_NativeApp"
    }
}
