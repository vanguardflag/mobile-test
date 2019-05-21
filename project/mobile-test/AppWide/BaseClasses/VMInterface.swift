//
//  VMInterface.swift
//  mobile-test
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func willLoadData()
    func didLoadData()
}

protocol ViewModelType {
    func initData()
    var delegate: ViewModelDelegate? { get set }
}
