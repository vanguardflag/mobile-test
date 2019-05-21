//
//  GlobalConfigurator.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/9/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit

class GlobalConfigurator {
    static func createController<controllerType>(controllerType: controllerType, storyboard: String, identifier: String) -> controllerType {
        let controller = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier) as? controllerType
        guard let controllerToReturn = controller else {
            fatalError("could not make" + identifier)
        }
        return controllerToReturn
    }
}
