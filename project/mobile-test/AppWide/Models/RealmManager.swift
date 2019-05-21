//
//  RealmManager.swift
//  agriBank
//
//  Created by Apple on 3/25/19.
//  Copyright © 2019 bki. All rights reserved.
//

import Foundation
import  RealmSwift




protocol RealmManagers {
    func deleteDatabase()
    func deleteObject(objs : Object)
    func saveObjects(objs: Object)
    func editObjects(objs: Object)
    func getObjects(type: Object.Type) -> Results<Object>?
}
class RealmManager:RealmManagers {
    let realm = try? Realm()
    
    // delete table
    func deleteDatabase() {
        try! realm?.write({
            realm?.deleteAll()
        })
    }
    
    // delete particular object
    func deleteObject(objs : Object) {
        try? realm!.write ({
            realm?.delete(objs)
        })
    }
    
    //Save array of objects to database
    func saveObjects(objs: Object) {
        try? realm!.write ({
            // If update = false, adds the object
            realm?.add(objs, update: false)
        })
    }
    
    // editing the object
    func editObjects(objs: Object) {
        try? realm!.write ({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm?.add(objs, update: true)
        })
    }
    
    //Returs an array as Results<object>?
    func getObjects(type: Object.Type) -> Results<Object>? {
        return realm!.objects(type)
    }
    
    
    
    //    func incrementID() -> Int {
    //
    //        return (realm!.objects("People".self).max(ofProperty: "id") as Int? ?? 0) + 1
    //    }
    
    
}

