//
//  DataExtension.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import Foundation

extension Data {
    
    func decode<T>() throws -> T where T: Decodable {
        return try JSONDecoder().decode(data: self)
    }
    
}
extension Data {
    /**
     Decodes json to model
     
     - Returns: Desired *model*
     - Throws: An error if any value throws an error during decoding.
     
     ## Example
     ```
     let newPerson: Person? = try? data.jsonDecode()
     ```
     */
    func jsonDecode<T>() throws -> T where T: Codable {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
