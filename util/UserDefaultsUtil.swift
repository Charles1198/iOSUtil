//
//  UserDefaultsUtil.swift
//  pubmed_ios
//
//  Created by charles on 16/12/20.
//  Copyright © 2016年 bqteam. All rights reserved.
//

import UIKit

class UserDefaultsUtil {
    /// 判断是否保存key为key的键值对
    class func hasObjectForKey(key : String) -> Bool {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: key)
        if value == nil {
            return false
        } else if value as! String == "" {
            return false
        }
        return true
    }
    
    /// 保存键值对
    ///
    /// - Parameters:
    ///   - value: 值
    ///   - key: 键
    ///   - tag: 标签
    class func put(value: Any?, forKey key: String, andTag tag: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key + tag)
        defaults.synchronize()
    }
    
    /// 保存键值对
    class func put(value: Any?, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    /// 获取string值
    class func getString(key: String) -> String {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: key)
        if value == nil {
            return ""
        }
        return value as! String
    }
    
    /// 获取bool值
    class func getBool(key: String) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    /// 获取int值
    class func getInt(key: String) -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: key)
    }

    /// 删除键值对
    class func remove(key: String) -> Void {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
}
