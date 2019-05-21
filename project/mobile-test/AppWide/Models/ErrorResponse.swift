//
//  ErrorResponse.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import Foundation
/////////////////////////
// MARK: - error
////////////////////////
class ErrorResponseMessage: Codable {
    
    var Message: String?
    var status: String?
    public init() {}
    init(Message: String) {
        self.Message = Message
    }
}
