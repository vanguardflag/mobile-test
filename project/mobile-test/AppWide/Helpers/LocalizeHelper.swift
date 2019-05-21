//
//  LocalizeHelper.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/23/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class UILocalizedLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        text = text
    }
}

class UILocalizedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        let title = self.title(for: .normal)?.localized()
        setTitle(title, for: .normal)
        self.titleLabel!.font = UIFont(name: "IRANSansMobile", size: 16)!
        

    }
}
final class UILocalizedTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        placeholder = placeholder?.localized()
        self.font = UIFont(name: "IRANSansMobile", size: 14)
    }
}

final class UILocalizedSkyTextField: SkyFloatingLabelTextField{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "IRANSansMobile", size: 14)
        placeholder = placeholder?.localized()
    }
}


