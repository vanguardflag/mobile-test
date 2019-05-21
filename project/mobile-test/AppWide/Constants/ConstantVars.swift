//
//  ConstantVars.swift
//
//
//  Created by Jalal Najafi .
//  Copyright © 2018  . All rights reserved.
//

import Foundation
import UIKit

let TITLE_VIEW = "title_view"

let IS_REGISTERED = "is_registered"
let IS_INITIALED = "is_initialed"

var limitation_Bal = 10
var limitation_Stm = 10
let BAL_LIMITATION = "limitation_Bal"
let STM_LIMITATION = "limitation_Stm"
let STM = "stm_"
let BAL = "bal_"


let defualt_Card = "defualt_Card"
let defualt_Account = "defualt_Account"



let USER_NAME = "user_name"
let USER_NAME_TEMP = "user_name_Temp"


class ConstantVars {
    static let size: Int = 25
    
}

let ClientMode = "1"
enum DistributionCode:String {
    case SibBank = "30"
    case Sibche = "50"
}



enum UserDefaultList : String {
    
    case ApplicationId        = "AppId"
    case LastTokenId1         = "LastA1"
    case LastTokenId2         = "LastA2"
    case MobileNumber         = "MobileNumber"
    case CurrentTransactionId = "CurrentTransactionId"
    case HasBeenRegsitered    = "HasBeenRegsitered"
    case SessionID            = "SessionID"
    case StorageKey           = "StorageKey"
    case Mobile_Key_Client_Identifier = "MobileKeyClientIdentifier"
    case Mobile_Key_Secret_Key = "MobileKey_Secret_Key"
    case OTP_Active = "OTP_Active"
    case BR_TouchIdFlag = "TouchIdFlag"
    case defualt_Account = "defualt_Account"
    case currentUserName = "currentUserName"
    
}

enum FontFamilies:String {
    case IRANSansMobile = "IRANSansMobile"
    case IRANSansMobile_Black = "IRANSansMobile-Black"
    case IRANSansMobile_Bold = "IRANSansMobile-Bold"
    case IRANSansMobile_Light = "IRANSansMobile-Light"
    case IRANSansMobile_Medium = "IRANSansMobile-Medium"
    case IRANSansMobile_UltraLight = "IRANSansMobile-UltraLight"
    case BYekan = "BYekan+"
    case BYekanPlusBold = "BYekan+-Bold"
    case BYekanPlus = "BYekanPlus"
    case Times_New_Roman = "Times New Roman"
    
    
    
    
}

var BaseFont = FontFamilies.IRANSansMobile.rawValue
var BaseFontBold = FontFamilies.IRANSansMobile_Bold.rawValue
var BaseFontLight = FontFamilies.IRANSansMobile_Light.rawValue

var TitleFont = UIFont(name: BaseFontBold, size: 18)
var subTitleFont = UIFont(name: BaseFont, size: 17)
var infoFont = UIFont(name: BaseFont, size: 14)
var labelFont = UIFont(name: BaseFont, size: 16)
var labelBoldFont = UIFont(name: BaseFontBold, size: 16)
var buttonFont = UIFont(name: BaseFontBold, size: 16)
var tabFont = UIFont(name: BaseFont, size: 10)
var textFieldFont = UIFont(name: BaseFont, size: 14)
var smallHeadingFont = UIFont(name: BaseFont, size: 10)
var detialFont = UIFont(name: BaseFont, size: 12)
var lightFont = UIFont(name: BaseFontLight, size: 10)
var bigdetialFont = UIFont(name: BaseFont, size: 14)

enum OperationCodes : Int {
    
    case kOperationCodeAuthentication            = 0x13F7 //5111
    case kOperationCodeRequestVerifyCode         = 0x13F8 //5112
    case kOperationCodeSendVerifyCode            = 0x13F9 //5113
    
    case kOperationCodeLogin                     = 0x1401 //5121
    
    case kOperationCodeSignOut                   = 0x1402 //5122
    case kOperationCodeChangePassword            = 0x1403 //5123
    case kOperationCodeForgetPassword            = 0x1404 //5124
    case kOperationCodeGetOTPKey                 = 0x1405 //5125
    case kOperationCodeSendOTPStatus             = 0x1406 //5126
    
    //------------------------------------------------------
    case kOperationCodeVoucherInquiry            = 0x14BE //5310
    case kOperationCodeMobileBillInquiry         = 0x14C8 //5320
    case kOperationCodeBillInquiry               = 0x14CD //5325
    
    
    //------------------------------------------------------
    case kOperationCodeGetAccountCard            = 0x1586 //5510
    case kOperationCodeAccountBalance            = 0x1587 //5511
    case kOperationCodeAccountRoll               = 0x1588 //5512
    case kOperationCodeChangeAccountPass         = 0x1589 //5513
    case kOperationCodeGetAccountInfo            = 0x158A //5514
    
    case kOperationCodeInternalTransferInquiry   = 0x1591 //5521
    case kOperationCodeInternalTransferPayment   = 0x1592 //5522
    case kOperationCodeAchTransfer               = 0x1593 //5523
    case kOperationCodeAchInquiry                = 0x1594 //5524
    case kOperationCodeTrackAch                  = 0x1595 //5525
    
    case kOperationCodeChequieInquiry            = 0x15A5 //5541
    case kOperationCodeLoanInquiry               = 0x15A6 //5542
    case kOperationCodeLoanPayment               = 0x15A7 //5543
    case kOperationCodeIbanInquiry               = 0x15A8 //5544
    
    case kOperationCodeAccountPayBill            = 0x15AF //5551
    case kOperationCodeAccountPayMobileBill      = 0x15B0 //5552
    
    case kOperationCodeUnAssignAccount           = 0x15B8 //5560
    
    
    //------------------------------------------------------
    case kOperationCodeGetCardBalance            = 0x15EB //5611
    case kOperationCodeCardRoll                  = 0x15EC //5612
    
    case kOperationCodeCardTransferInquiry       = 0x15F5 //5621
    case kOperationCodeCardTransferPayment       = 0x15F7 //5623 was 5622 (0x15F6)
    
    case kOperationCodeCardPayBill               = 0x1613 //5651
    case kOperationCodeCardPayMobileBill         = 0x1614 //5652
    case kOperationCodeBlockCard                 = 0x1615 //5653
    case kOperationCodePayPinVoucher             = 0x1617 //5655
    case kOperationCodePayDirectVoucher          = 0x1618 //5656
    
    //------------------------------------------------------
    case kOperationCodeOldVouchers               = 0x164E //5710
    
    //------------------------------------------------------
    case kOperationCodeUnAssignCard              = 0x1676 //5750
    
    case kOperationCodeActiveTel              = 0x1A37 //6711
    case kOperationCodeGetInfoByTel              = 0x1A36 //6710
    //
    case kOperationCodeWebMobile                 = 0x1A9A //6810
}


enum Identifiers:String{
    case SequeSetUsernamePassword = "SequeSetUsernamePassword"
    case SequeGetActivationCode = "SequeGetActivationCode"
    
}

enum AccountCardType: Int {
    case account = 1
    case card    = 2
    case none    = 3
}
enum UsefullNum: Int {
    case account = 1
    case card    = 2
    case shaba    = 3
    case loan = 4
    case bill = 5
    case mobile = 6
}


let accountCollection :[[String:Any]] = [
    ["index" : 0, "imageSource" : "action_account_balance" , "Title" : "action_name_account_balance"],
    ["index" : 1, "imageSource" : "action_account_roll" , "Title" : "action_name_account_roll"],
    ["index" : 2, "imageSource" : "action_transfer_internal" , "Title" : "action_name_account_inter_transfer"],
    ["index" : 3, "imageSource" : "action_transfer_paya" , "Title" : "action_name_transfer_paya"],
    ["index" : 4, "imageSource" : "action_transfer_trackpaya" , "Title" : "action_name_account_paya_tracking"],
    ["index" : 5, "imageSource" : "action_account_loan" , "Title" : "action_name_account_pay_loan"],
    ["index" : 6, "imageSource" : "action_account_cheque" , "Title" : "action_name_account_cheque_inquiry"],
    ["index" : 7, "imageSource" : "action_pay_bill" , "Title" : "action_name_account_bill_payment"],
    ["index" : 8, "imageSource" : "action_account_pass" , "Title" : "action_name_account_change_account_password"],
    ["index" : 10, "imageSource" : "action_account_iban" , "Title" : "action_name_account_iban_inquiry"],
    ["index" : 11, "imageSource" : "action_unassign" , "Title" : "action_name_account_un_assign"]
]


let cardCollection :[[String:Any]] = [
    ["index" : 0, "imageSource" : "action_card_balance" , "Title" : "action_name_cards_balance"],
    ["index" : 1, "imageSource" : "action_transactions" , "Title" : "action_name_cards_roll"],
    ["index" : 2, "imageSource" : "action_transfer_card" , "Title" : "action_name_transfer_card"],
    ["index" : 3, "imageSource" : "action_pay_bill" , "Title" : "action_name_bill_payment"],
    ["index" : 4, "imageSource" : "action_pay_voucher" , "Title" : "action_name_mobile_voucher"],
    ["index" : 5, "imageSource" : "action_pay_voucher" , "Title" : "action_name_get_last_mobile_vouchers"],
    ["index" : 6, "imageSource" : "action_card_block" , "Title" : "action_block_card"],
    ["index" : 7, "imageSource" : "action_unassign" , "Title" : "action_un_assign_card"]
]
