//
//  ResInfoTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class ResInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblTitle: UISubTitleLabel!
    @IBOutlet weak var lblSubTitle: UISmallLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(img:String,title:String,subTitle:String) {
        self.lblTitle.text = title.removeHTMLTags
        self.lblSubTitle.text = subTitle.removeHTMLTags
        self.imgItem.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "placeholder.png"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
