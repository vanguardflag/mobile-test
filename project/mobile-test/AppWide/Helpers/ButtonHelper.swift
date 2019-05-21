//
//  ButtonHelper.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/29/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit

final class UIBackButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        if GlobalVar.shared.isRTL {
            self.transform = self.transform.rotated(by: CGFloat(Double.pi))
        }
    }
}
