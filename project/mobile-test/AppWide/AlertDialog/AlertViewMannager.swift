//
//  AlertViewMannager.swift
//  agriBank
//
//  Created by Apple on 3/17/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit
import Foundation
import SCLAlertView

class AlertViewManager: NSObject {
    
    
    override  init() {
    }
    
    func displayGeneralErrorMessageMessage(boxTitle: String, bodyMessage: String) {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: TitleFont!,
            kTextFont: infoFont!,
            kButtonFont: buttonFont!,
            showCloseButton: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("Yes".localized()) {
            print("Yes".localized())
        }
        
        alertView.showError(boxTitle, subTitle: bodyMessage, closeButtonTitle:"Yes".localized())
        
    }
    
    func showAlertViewWithDuration(alertTitle : String, alertSubTitle: String, duration : Double, doneTitle: String) {
        
        let timeoutValue: TimeInterval = duration
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            print("Timeout occurred")
        }
        SCLAlertView().showTitle(alertTitle, subTitle: alertSubTitle, style: .error, closeButtonTitle: "close", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: timeoutValue, timeoutAction: timeoutAction), colorStyle: 0xDD534B, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: SCLAnimationStyle.bottomToTop)
        
        
        
        
        
        
        
    }
    func displayWait(title: String)->SCLAlertView {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: TitleFont!,
            kTextFont: infoFont!,
            kButtonFont: buttonFont!,
            showCloseButton: false
            
        )
        
        let wait = SCLAlertView(appearance: appearance)
        
        let alertViewIcon = UIImage(named: "ic_logo_white")
        
        wait.showWait("", subTitle: title,closeButtonTitle:nil,colorStyle: 0x3C8741, circleIconImage:alertViewIcon)
        
        return wait
    }
    
    func displayAlerViewWithResponse(title:String, subTitle:String, buttonsSpec: [String:Int], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
//            kTitleFont: TitleFont!,
//            kTextFont: infoFont!,
//            kButtonFont: buttonFont!,
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        
        for (key,value) in buttonsSpec {
            alert.addButton("\(key)") {
                onCompletion(value,["Result":key,"Value":value])
            }
        }
        
        alert.showWarning(title, subTitle: subTitle)
    }
    
    func displayErrorViewWithResponse(title:String, subTitle:String, buttonsSpec: [String:Int], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: TitleFont!,
            kTextFont: infoFont!,
            kButtonFont: buttonFont!,
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        
        for (key,value) in buttonsSpec {
            alert.addButton("\(key)") {
                onCompletion(value,["Result":key,"Value":value])
            }
        }
        
        alert.showError(title, subTitle: subTitle)
    }
    
    
    func displayAlerWithConfirmation(title:String, subTitle:String, buttonsSpec: [String:Int], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            
            kTitleFont: UIFont(name: "BYekan", size: 20)!,
            kTextFont: UIFont(name: "BYekan", size: 14)!,
            kButtonFont: UIFont(name: "BYekan", size: 14)!,
            showCloseButton: false
            
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        for (key,value) in buttonsSpec {
            alert.addButton("\(key)") {
                onCompletion(value,["Result":key,"Value":value])
            }
        }
        
        
        alert.showSuccess(title, subTitle: subTitle, closeButtonTitle : "ادامه")
    }
    
    
    
    func dismissAlertView() {
        SCLAlertView().hideView()
    }
    
    func displayAlertSuccessMessage(title:String, subTitle:String, buttonsSpec:[String:Int], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "BYekan", size: 20)!,
            kTextFont: UIFont(name: "BYekan", size: 14)!,
            kButtonFont: UIFont(name: "BYekan", size: 14)!,
            showCloseButton: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        
        
        for (key,value) in buttonsSpec {
            alertView.addButton("\(key)") {
                onCompletion(value,["Result":key,"Value":value])
            }
        }
        
        alertView.showSuccess(title, subTitle: subTitle)
        
        
    }
    
    func displayAlertGetActiveTelMessage(title:String, subTitle:String, buttonsSpec:[String:Int], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "BYekan", size: 20)!,
            kTextFont: UIFont(name: "BYekan", size: 14)!,
            kButtonFont: UIFont(name: "BYekan", size: 14)!,
            showCloseButton: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        
        
        for (key,value) in buttonsSpec {
            alertView.addButton("\(key)") {
                onCompletion(value,["Result":key,"Value":value])
            }
        }
        
        alertView.addButton("انصراف") {
            self.dismissAlertView()
        }
        
        alertView.showSuccess(title, subTitle: subTitle,closeButtonTitle:"انصراف")
        
        
    }
    
    func displayInfoMessage(title:String, subTitle:String, buttonsSpec: [String:Any], onCompletion:@escaping (_ success:Int, _ dataReturn: [String:Any]?)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "ic_logo_white") //Replace the IconImage text with the image name
        
        //let alertView = SCLAlertView()
        
        if let titleOK = buttonsSpec["titleOK"] as? String{
            alertView.addButton(titleOK) {
                onCompletion(1, ["Message":"titleOK"])
            }
            
        }
        
        let timeoutValue: TimeInterval = 60.0
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            print("Timeout occurred")
        }
        
        alertView.showSuccess(title, subTitle: subTitle, closeButtonTitle:nil,timeout:SCLAlertView.SCLTimeoutConfiguration(timeoutValue: timeoutValue, timeoutAction: timeoutAction), circleIconImage:alertViewIcon)
        
    }
    
    
    
    
    
    
    func displayGetTelNumber( onCompletion:@escaping (_ success:Int, _ dataReturn: String)->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            
            
            kTitleFont: TitleFont!,
            kTextFont: infoFont!,
            kButtonFont: buttonFont!,
            showCloseButton: false,
            showCircularIcon: true
            
            
        )
        
        
        
        let alert = SCLAlertView(appearance: appearance)
        
        let subview = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 216, height: 80)))
        let x = (subview.frame.width - 180) / 2
        
        let lblTitle = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: subview.frame.width, height: 30)))
        
        lblTitle.font = TitleFont
        //lblTitle.fontSizeToFit()
        lblTitle.lineBreakMode = .byWordWrapping
        lblTitle.numberOfLines = 3
        lblTitle.text = "لطفا شماره موبایل خود را جهت دریافت اطلاعات وارد نمایید"
        lblTitle.textAlignment = NSTextAlignment.center
        
        subview.addSubview(lblTitle)
        
        
        // Add textfield 1
        let textfield1 = UITextField(frame: CGRect(origin: CGPoint(x: 0,y :lblTitle.frame.maxY + 10), size: CGSize(width: subview.frame.width, height: 30)))
        
        textfield1.layer.borderColor = UIColor.agriGreen as! CGColor
        textfield1.layer.borderWidth = 1
        textfield1.layer.cornerRadius = 3
        textfield1.placeholder = "0912_______"
        textfield1.keyboardType = .numberPad
        textfield1.textAlignment = NSTextAlignment.center
        
        
        
        let button = UIButton(type: .custom)
        let imageContact = UIImage(named: "ic_contact.png")
        button.setImage(imageContact, for: .normal)
        
        // set frame on image before adding it to the uitextfield
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        // set frame on image before adding it to the uitextfield
        button.frame = CGRect(x: 5, y: 5, width: (imageContact?.size.width)!, height: (imageContact?.size.height)!)
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        textfield1.rightView = button
        textfield1.rightViewMode = .unlessEditing
        
        
        
        subview.addSubview(textfield1)
        
        alert.customSubview = subview
        //let txt = alert.addTextField("0912_______")
        alert.addButton("تایید") {
            //print("Text value: \(txt.text)")
            onCompletion(1, textfield1.text!)
        }
        alert.addButton("انصراف") {
            
            self.dismissAlertView()
        }
        
        let alertViewIcon = UIImage(named: "mobiles")
        alert.showInfo("شماره موبایل", subTitle: "لطفا شماره موبایل خود را جهت دریافت اطلاعات وارد نمایید", closeButtonTitle:"",colorStyle: 0x3C8741,
                       colorTextButton: 0xFFFFFF, circleIconImage: alertViewIcon)
        
        
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        NotificationCenter.default.post(name:NSNotification.Name("OpenContacts"), object: nil)
    }
    
}
