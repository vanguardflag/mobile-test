//
//  NavigationExtension.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/22/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit
extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}
