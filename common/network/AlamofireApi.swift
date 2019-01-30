//
//  AlamofireApi.swift
//  pubmed_ios
//
//  Created by charles on 16/12/19.
//  Copyright © 2016年 bqteam. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireApi: NSObject {
    static var userAgent = ""
	
	static let sharedSessionManager: Alamofire.SessionManager = {
		let configuration = URLSessionConfiguration.default
		configuration.timeoutIntervalForRequest = 6
		return Alamofire.SessionManager(configuration: configuration)
	}()
    
    /// 检查网络是否连接
    ///
    /// - Returns: <#return value description#>
    class func isNetworkConnected() -> Bool {
        let manager = NetworkReachabilityManager(host: "https://www.baidu.com")!
        return manager.isReachable
    }
    
    /// 检查网络连接状态
    ///
    /// - Returns: 0->无网络连接/未知 1->移动网络 2->wifi网络
    class func checkNetworkStatus() -> Int {
        let manager = NetworkReachabilityManager(host: "https://www.baidu.com")!
        if manager.isReachable {
            if manager.isReachableOnEthernetOrWiFi {
                return 2
            }
            if manager.isReachableOnWWAN {
                return 1
            }
            return 0
        }
        return 0
    }
    
    
    /// 发起请求
    ///
    /// - Parameters:
    ///   - requestMethod: 请求方法
    ///   - requestUrl: 请求地址
    ///   - parameters: 请求参数
    ///   - completionHandler: 请求完成数据返回
    class func makeResuest(requestMethod : HTTPMethod,
                           requestUrl : String,
                           parameters : Parameters?,
                           completionHandler : @escaping (DataResponse<Data>) -> Void) {
        if userAgent == "" {
            userAgent = setupUserAgent()
        }
        //执行网络请求
        sharedSessionManager.request(requestUrl, method: requestMethod, parameters: parameters, encoding: URLEncoding.default, headers: ["User-Agent": userAgent]).responseData { (response) in
            completionHandler(response)
        }
    }
    
    /// 上传文件
    ///
    /// - Parameters:
    ///   - data: <#data description#>
    ///   - url: <#url description#>
    ///   - completionHandler: <#completionHandler description#>
    class func uploadData(data: Data, to url: String, completionHandler : @escaping (DataResponse<Data>) -> Void) {
        sharedSessionManager.upload(data, to: url).responseData { (response) in
            completionHandler(response)
        }
    }
    
    private class func setupUserAgent() -> String {
        //User-Agent: ShortName/math_online AppVersion/1.0.2 OSRelease/Android@version Model/VKY-AL00 Brand/HUAWEI
        
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        let model = UIDevice.current.model
        let version = UIDevice.current.systemVersion
        
        let agent = "ShortName/teacher AppVersion/\(appVersion) OSRelease/iOS@\(version) Model/\(model) Brand/Apple"
        return agent
    }
    
    /// 找出连接速度最快的url
    ///
    /// - Parameters:
    ///   - list: url集合
    ///   - completionHandler: <#completionHandler description#>
    class func fastestServer(list: Array<String>, completionHandler: @escaping(String) -> Void) {
        var urlList = Array<String>()
        for url in list {
            urlList.append(url)
        }
        
        var fastestUrl = ""
        for url in urlList {
            sharedSessionManager.request(url).responseData { (response) in
                if response.result.isSuccess {
                    // 第一个请求到的就是最快的url
                    if fastestUrl == "" {
                        fastestUrl = url
                        completionHandler(fastestUrl)
                    }
                } else {
                    // 将该call从callList中删掉
                    // 当callList被删光，说明所有call都失败了，那么url参数传""表示所有url都无法连通
                    let index = urlList.firstIndex(of: url)
                    urlList.remove(at: index!)
                    if urlList.count == 0 {
                        completionHandler("")
                    }
                }
            }
        }
    }
}
