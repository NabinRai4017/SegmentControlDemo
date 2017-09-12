//
//  UserDefaultHandler.swift
//  SegmentControlDemo
//
//  Created by nabinrai on 9/12/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import Foundation


struct UserDefaultsHandler {
    
    let userDefault = UserDefaults.standard
    
    func setToUD(key: String, value: AnyObject) {
        self.userDefault.setValue(value, forKeyPath: key)
        self.userDefault.synchronize()
    }
    
    func setDataUD(key:String,value:AnyObject) {
        self.userDefault.set(value, forKey: key)
        self.userDefault.synchronize()
    }
    
    func removeUD(key: String) {
        self.userDefault.removeObject(forKey: key)
    }
    
    func getUDValue(key:String) -> AnyObject? {
        return self.userDefault.value(forKey: key) as AnyObject?
    }
}



