//
//  UrlConst.swift
//  pubmed_ios
//
//  Created by charles on 2017/3/7.
//  Copyright © 2017年 bqteam. All rights reserved.
//

//import Foundation

//appManager地址
//测试地址
let URL_APPMANAGER = "https://yapi.bqteam.com/mock/11/"
let URL_APP = "https://api-tomcat-test.bqteam.com/jszgz/"
let BASE_URL = "baseUrl"

let DATA = "data"
let STATUS_CODE = "statusCode"
let MESSAGE = "message"

let CODE_SUCCEED = "S0000000"
let CODE_NO_EXERCISE = "S1020000"

// 控制中心
let SUBMIT_CRASH_FILE = URL_APPMANAGER + "api/v1/ticket/app-exception"
let SUBMIT_API_ERROR = URL_APPMANAGER + "api/v1/ticket/api-exception"
let GET_UUID = URL_APPMANAGER + "api/v1/device/mobile-registration"
let REGISTER_APP = URL_APPMANAGER + "api/v1/app/registration"
let SUBMIT_FEEDBACK_CONTENT = URL_APPMANAGER + "api/v1/ticket/app-feedback"

// 检查token是否过期
let INITIALIZATION = URL_APPMANAGER + "initialization"

// 用户接口
let GET_CODE_BY_TEL = URL_APP + "api/tel/code"
let GET_CODE_BY_EMAIL = URL_APP + "api/email/code"
let REGISTER_BY_TEL = URL_APP + "api/register/tel"
let REGISTER_BY_EMAIL = URL_APP + "api/register/email"
let RESET_PASSWORD_BY_TEL = URL_APP + "api/password/tel"
let RESET_PASSWORD_BY_EMAIL = URL_APP + "api/password/email"
let RESET_TOKEN = URL_APP + "api/token"

// 科目
let GET_SUBJECT = URL_APP + "subject"

// 章
let GET_CHAPTER = URL_APP + "chapter"

// 题目
let GET_EXERCISE = URL_APP + "exercise"
let ANSWER_EXERCISE = URL_APP + "exercise/answer"

// 收藏题集
let GET_COLLECT_EXERCISE = URL_APP + "favorite/collection/exercise"
let ADD_COLLECT_EXERCISE = URL_APP + "favorite/collection/exercise"
let REMOVE_COLLECT_EXERCISE = URL_APP + "favorite/collection/exercise"
let GET_COLLECT_STATUS = URL_APP + "favorite/collection/exercise/status"
let GET_COLLECT_CHAPTER = URL_APP + "favorite/collection/index"

// 错题集
let GET_MISTAKE_EXERCISE = URL_APP + "wrong/collection/exercise"
let REMOVE_MISTAKE_EXERCISE = URL_APP + "wrong/collection/exercise"
let GET_MISTAKE_CHAPTER = URL_APP + "wrong/collection/index"

// 试卷
let GET_PAPER_LIST = URL_APP + "paper/list"
let GET_PAPER_EXERCISE = URL_APP + "paper/exercise"



