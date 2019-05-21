//
//  CategoryTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillData(title:String,subTitle:String) {
        self.title.text = title
        self.subTitle.text = subTitle
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
