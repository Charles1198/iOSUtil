//
//  Tools.swift
//  pubmed_ios
//
//  Created by charles on 16/12/20.
//  Copyright © 2016年 bqteam. All rights reserved.
//

import UIKit
import AdSupport

class Tools {
    class func collectDeviceInfo() -> NSDictionary {
        let infoDic = NSMutableDictionary.init()
        
        //ClientInfo
        infoDic.setValue("{}", forKey: "client_info")
        
        //Imei
        let idfv = UIDevice.current.identifierForVendor?.uuidString
        infoDic.setValue(idfv, forKey: "imei")
        
        //OsRelease
        let release = UIDevice.current.systemName
        infoDic.setValue(release, forKey: "os_release")
        
        //OsSdk
        let sdk = UIDevice.current.systemVersion
        infoDic.setValue(sdk, forKey: "os_sdk")
    
        //PhoneCpu
        infoDic.setValue("0", forKey: "phone_cpu")
        
        //PhoneMemory
        infoDic.setValue("0", forKey: "phone_memory")
        
        //PhoneModle
        let model = UIDevice.current.model
        infoDic.setValue(model, forKey: "phone_model")
        
        //Network
        let network = AlamofireApi.checkNetworkStatus()
        infoDic.setValue(network, forKey: "phone_network")
        
        //PhoneSize
        infoDic.setValue("\(UIScreen.main.bounds.width)" + "*" + "\(UIScreen.main.bounds.height)", forKey: "phone_size")
        
        //PhoneSystem
        infoDic.setValue("2", forKey: "phone_system")
        
        return infoDic
    }
    
    class func getAppVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    class func isX() -> Bool {
        if UIScreen.main.bounds.height >= 812 {
            return true
        }
        return false
    }
}
