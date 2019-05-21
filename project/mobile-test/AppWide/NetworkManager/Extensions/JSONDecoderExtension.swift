//
//  JSONDecoderExtension.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import Foundation

/////////////////////////
// MARK: - JsonDecoder
////////////////////////

extension JSONDecoder {
    func decode<T>(data: Data) throws -> T where T: Decodable {
        return try self.decode(T.self, from: data)
    }
}

extension KeyedDecodingContainer {
    
    func decode<T: Decodable>(forKey key: KeyedDecodingContainer.Key) throws -> T {
        return try decode(T.self, forKey: key)
    }
    
    func decodeIfPresent<T: Decodable>(forKey key: KeyedDecodingContainer.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
    
}
