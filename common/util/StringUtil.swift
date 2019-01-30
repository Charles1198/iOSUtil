//
//  StringUtil.swift
//  teacher
//
//  Created by yueji Jia on 2018/12/3.
//  Copyright © 2018年 charles. All rights reserved.
//
import Foundation

class StringUtil {
	
	/// 验证手机号格式是否正确
	class func isTel(_ string: String) -> Bool {
		let regex = "^[1][0-9]{10}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: string)
	}
	
	/// 验证邮箱格式是否正确
	class func isEmail(_ string: String) -> Bool {
		let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: string)
	}
	
	/// 验证验证码格式是否正确
	class func isCode(_ string: String) -> Bool {
		let regex = "^[0-9]{4}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: string)
	}
	
}

