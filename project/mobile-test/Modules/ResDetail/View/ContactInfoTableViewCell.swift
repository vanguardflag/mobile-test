//
//  ContactInfoTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit
import MessageUI

class ContactInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UITitleLabel!
    @IBOutlet weak var lblSubTitle: UISubTitleLabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var web: UIButton!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var sms: UIButton!
    var value: String = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(title:String,subTitle:String,value:String?,emailVisibility:Bool,webVisibility:Bool,callVisibility:Bool,smsVisibility:Bool) {
        self.lblTitle.text = title
        self.lblSubTitle.text = value
        self.email.isHidden = emailVisibility
        self.web.isHidden = webVisibility
        self.call.isHidden = callVisibility
        self.sms.isHidden = smsVisibility
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func sendSms(_ sender: Any) {
        GoToURL.sendSMS(number: value)
    }
    
    @IBAction func callPhone(_ sender: Any) {
        GoToURL.makeCall(number: value, prompt: true)
    }
    
    @IBAction func goWeb(_ sender: Any) {
        GoToURL.openWebsite(urlAddress: value)
    }
    @IBAction func sendEmail(_ sender: Any) {
        GoToURL.sendEmail(emailAddress: value)
    }
    
}
