//
//  BasePresenter.swift
//  teacher
//
//  Created by charles on 2018/10/27.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol BasePresenterDelegate: NSObjectProtocol {
	func noNetwork()
	func serverError()
}

class BasePresenter {
    
    /// 简单封装的网络请求
    ///
    /// - Parameters:
    ///   - method: 请求方法
    ///   - url: 请求地址
    ///   - parameters: 请求参数
    ///   - succeed: 请求成功回调
    ///   - failure: 请求失败的回调
    func makeResuest(method : HTTPMethod,
                     url : String,
                     parameters : Parameters?,
                     succeed: @escaping (JSON) -> Void,
                     failure: @escaping (String, String) -> Void) {
		makeResuest(method: method, url: url, parameters: parameters, succeed: succeed, failure: failure) {}
    }
    
    /// 简单封装的网络请求
    ///
    /// - Parameters:
    ///   - method: 请求方法
    ///   - url: 请求地址
    ///   - parameters: 请求参数
    ///   - succeed: 请求成功回调
	///   - failure: 请求失败的回调
    ///   - requestAgain: 如果token过期，刷新成功的回调
    func makeResuest(method : HTTPMethod,
                     url : String,
                     parameters : Parameters?,
					 succeed: @escaping (JSON) -> Void,
					 failure: @escaping (String, String) -> Void,
                     requestAgain: @escaping () -> Void) {
        AlamofireApi.makeResuest(requestMethod: method, requestUrl: url, parameters: parameters) { (response) in
            if response.result.isSuccess {
                do {
                    let json = try JSON(data: response.data!)
                    let statusCode = json[STATUS_CODE].stringValue
                    if statusCode == CODE_SUCCEED {
                        succeed(json[DATA])
                    } else if statusCode == "201" {
                        self.resetToken(succeed: {
                            requestAgain()
                        })
                    } else {
						let message = json[MESSAGE].stringValue
                        failure(statusCode, message)
                        
                        let HTTPStatusCode: String = response.response?.statusCode.description ?? ""
                        self.submitRequestError(requestURL: url,
                                                requestMethod: method.rawValue,
                                                requestHeader: response.request?.allHTTPHeaderFields,
                                                requestParams: parameters,
                                                responseHTTPStatusCode: HTTPStatusCode,
                                                responseStatusCode: statusCode,
                                                responseBody: json.rawString())
                    }
                } catch {
                    let HTTPStatusCode: String = response.response?.statusCode.description ?? ""
                    self.submitRequestError(requestURL: url,
                                            requestMethod: method.rawValue,
                                            requestHeader: response.request?.allHTTPHeaderFields,
                                            requestParams: parameters,
                                            responseHTTPStatusCode: HTTPStatusCode,
                                            responseStatusCode: HTTPStatusCode,
                                            responseBody: nil)
					failure(HTTPStatusCode, "数据解析失败")
                }
            } else {
                let HTTPStatusCode: String = response.response?.statusCode.description ?? ""
                self.submitRequestError(requestURL: url,
                                        requestMethod: method.rawValue,
                                        requestHeader: response.request?.allHTTPHeaderFields,
                                        requestParams: parameters,
                                        responseHTTPStatusCode: HTTPStatusCode,
                                        responseStatusCode: HTTPStatusCode,
                                        responseBody: nil)
				
				failure(HTTPStatusCode, "服务器连接失败")
            }
        }
    }
    
    /// 上传接口异常信息
    ///
    /// - Parameters:
    ///   - requestURL: <#requestURL description#>
    ///   - requestMethod: <#requestMethod description#>
    ///   - requestHeader: <#requestHeader description#>
    ///   - requestParams: <#requestParams description#>
    ///   - responseHTTPStatusCode: <#responseHTTPStatusCode description#>
    ///   - responseStatusCode: <#responseStatusCode description#>
    ///   - responseBody: <#responseBody description#>
    private func submitRequestError(requestURL: String,
                            requestMethod: String,
                            requestHeader: Parameters?,
                            requestParams: Parameters?,
                            responseHTTPStatusCode: String,
                            responseStatusCode: String,
                            responseBody: String?) {
        
        let requestHeaderString = requestHeader == nil ? "" : JSON(requestHeader as Any).rawString()
        let requestParamsString = requestParams == nil ? "" : JSON(requestParams as Any).rawString()
        let params = [
            "requestURL": requestURL,
            "requestMethod": requestMethod,
            "requestHeader": requestHeaderString,
            "requestParams": requestParamsString,
            "responseHTTPStatusCode": responseHTTPStatusCode,
            "responseStatusCode": responseStatusCode,
            "responseBody": responseBody,
            "responseAt": DateUtil.getCurTime(),
        ]
        print(params.description)
        makeResuest(method: .post, url: SUBMIT_API_ERROR, parameters: params as Parameters, succeed: { _ in
            // 上传成功。不做操作
		}) { _,_  in
            // 上传失败。不做操作
        }
    }
    
    /// 上传文件
    ///
    /// - Parameters:
    ///   - data: <#data description#>
    ///   - url: <#url description#>
    ///   - succeed: <#succeed description#>
    ///   - failure: <#failure description#>
    func uploadDate(data: Data,
                    to url: String,
                    succeed: @escaping (JSON) -> Void,
                    failure: @escaping (String) -> Void) {
        AlamofireApi.uploadData(data: data, to: url) { (response) in
            if response.result.isSuccess {
                do {
                    let json = try JSON(data: response.data!)
                    let statusCode = json[STATUS_CODE].stringValue
                    if statusCode == CODE_SUCCEED {
                        succeed(json[DATA])
                    } else {
                        failure(statusCode)
                    }
                } catch {
                    print("--- catch error ---")
                    print(url)
                }
            } else {
                failure("")
                print("--- request fail ---")
                print(url, response.result.error.unsafelyUnwrapped.localizedDescription)
            }
        }
    }
    
    /// 使用 refreshToken 获取新的 token，若 refreshToken 也过期了，跳转到登陆界面
    ///
    /// - Parameter succeed: <#succeed description#>
    func resetToken(succeed: @escaping () -> Void) -> Void {
        let param = [
			TOKEN: UserDefaultsUtil.getString(key: TOKEN),
			REFRESH_TOKEN: UserDefaultsUtil.getString(key: REFRESH_TOKEN)
		]
        AlamofireApi.makeResuest(requestMethod: .post, requestUrl: RESET_TOKEN, parameters: param) { (response) in
            if response.result.isSuccess {
                do {
                    let json = try JSON(data: response.result.value!)
                    let statusCode = json[STATUS_CODE].stringValue
                    
                    if statusCode == CODE_SUCCEED {
                        UserDefaultsUtil.put(value: json[DATA][TOKEN].rawValue, key: TOKEN)
                        UserDefaultsUtil.put(value: json[DATA][REFRESH_TOKEN].rawValue, key: REFRESH_TOKEN)
                        succeed()
                    } else {
                        self.toLogin()
                    }
                } catch {
                    self.toLogin()
                }
            } else {
                self.toLogin()
            }
        }
    }
    
    /// 返回登录界面
    private func toLogin() -> Void {
        
    }
}
