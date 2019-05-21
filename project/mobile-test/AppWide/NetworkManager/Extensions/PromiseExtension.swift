//
//  PromiseExtension.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//


import Foundation
import PromiseKit
/////////////////////////
// MARK: - Promise
////////////////////////
extension Promise where T: Decodable {
    
    /// checks if data is not nil, then decode data to model, create a new promise with model value
    convenience init(data: Data) throws {
        let model: T = try data.decode()
        self.init(value: model)
    }
    
    /// checks if data is not nil, then decode data to model, create a new promise with model value
    convenience init(data: Data, block: @escaping (_ model: T) throws -> Void) throws {
        let model: T = try data.decode()
        try block(model)
        self.init(value: model)
    }
    
}

extension Promise {
    
    convenience init<U>(promise: Promise<U>) where T == () {
        self.init { (resolve, reject) in
            promise.then { _ -> Void in
                resolve(())
                }.catch { error in
                    reject(error)
            }
        }
    }
    
    convenience init<U>(promise: Promise<U>, block: @escaping () throws -> Void) where T == () {
        self.init { (resolve, reject) in
            promise.then { _ -> Void in
                try block()
                resolve(())
                }.catch { error in
                    reject(error)
            }
        }
    }
}
