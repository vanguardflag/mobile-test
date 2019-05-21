//
//  UICharacterExtension.swift
//  agriBank
//
//  Created by Apple on 3/17/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation


extension Character
{
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}
