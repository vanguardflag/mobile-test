//
//  BusniessHoursTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class BusniessHoursTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(title:String,detial:String?){
        if let detials = detial{
            lblDetail.text = detials
        }else{
            self.lblDetail.text = "No Information"
        }
        self.lblTitle.text = title
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
