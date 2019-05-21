//
//  FontHelper.swift
//  agriBank
//
//  Created by Apple on 4/14/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

final class UITitleLabel: UILocalizedLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "IRANSansMobile", size: 20)
    }
}

final class UITitleLabel_BOLD: UILocalizedLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "IRANSansMobile_Bold", size: 20)
    }
}


final class UISubTitleLabel: UILocalizedLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "IRANSansMobile", size: 16)
    }
}

final class UINormalLabel: UILocalizedLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        let lng = (UserDefaults.standard.value(forKey: "lproj") as? Array ?? ["fa"]).first ?? "fa"
        if (lng == "fa"){
            self.text = StringHelper.convertToPersianDigits(input: self.text)
            self.font = UIFont(name: "IRANSansMobile", size: 14)
        }else{
            self.text = StringHelper.convertToEnglishDigits(input: self.text)
        }
    }
}

final class UISmallLabel: UILocalizedLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "IRANSansMobile", size: 12)
    }
}



final class UISmallButton: UILocalizedButton {
    override func awakeFromNib() {
        super.awakeFromNib()

        self.titleLabel!.font = UIFont(name: "IRANSansMobile", size: 12)!
        
    }
}
