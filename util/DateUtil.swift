//
//  DateUtil.swift
//  teacher
//
//  Created by charles on 2018/11/16.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit

class DateUtil {
    /*
     //获取当前时间
     let now = NSDate()
     
     // 创建一个日期格式器
     let dformatter = NSDateFormatter()
     dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
     print("当前日期时间：\(dformatter.stringFromDate(now))")
     
     //当前时间的时间戳
     let timeInterval:NSTimeInterval = now.timeIntervalSince1970
     let timeStamp = Int(timeInterval)
     print("当前时间的时间戳：\(timeStamp)")
     */
    
    /// 获取当前时间
    class func getCurTime() -> String {
        //获取当前时间
        let now = Date()
        
        //创建一个日期格式器
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormat.string(from: now)
    }
    
    /// 获取当前日期
    class func getCurDate() -> String {
        //获取当前时间
        let now = Date()
        
        //创建一个日期格式器
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        return dateFormat.string(from: now)
    }
    
    /// 获取当前年份
    class func getCurYear() -> String {
        //获取当前时间
        let now = Date()
        
        //创建一个日期格式器
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy"
        
        return dateFormat.string(from: now)
        
    }
    
    /// 比较日期
    ///
    /// - Parameters:
    ///   - date1: 日期1
    ///   - date2: 日期2
    /// - Returns: true: 日期1在日期2之前
    class func isDate(_ date1: String, beforeDate date2: String) -> Bool {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let d1 = dateFormat.date(from: date1)
        let d2 = dateFormat.date(from: date2)
        
        if d1 != nil && d2 != nil {
            return d1! < d2!
        } else {
            return false
        }
    }
    
    /// 获取 days 天后的时间
    ///
    /// - Parameters:
    ///   - date: 目标时间
    ///   - days: 间隔天数
    /// - Returns: days 天后的时间
    class func timeFromTime(_ time: String, afterDays days: Double) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let d = dateFormat.date(from: time)
        let dm = d?.addingTimeInterval(TimeInterval.init(60 * 60 * 24 * days))
        
        return dateFormat.string(from: dm!)
    }
    
    /// 获取 days 天后的时间
    ///
    /// - Parameters:
    ///   - date: 目标时间
    ///   - days: 间隔天数
    /// - Returns: days 天后的时间
    class func dateFromdate(_ date: String, afterDays days: Int) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let d = dateFormat.date(from: date)
        let dm = d?.addingTimeInterval(TimeInterval.init(60 * 60 * 24 * days))
        
        return dateFormat.string(from: dm!)
    }
    
    /// 获取 months 月后的时间
    ///
    /// - Parameters:
    ///   - date: 目标时间
    ///   - months: 月数
    /// - Returns: months 月后的时间
    class func dateFromDate(_ date: String, afterMonths months: Int) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let d = dateFormat.date(from: date)
        let afterDate = Calendar.current.date(byAdding: .month, value: months, to: d!)
        return dateFormat.string(from: afterDate!)
    }
    
    /// 判断给定的年份是否是闰年
    ///
    /// - Parameter year: 目标年份
    /// - Returns: 是否闰年
    class func isLeapYear(_ year: String) -> Bool {
        var leapYear = false
        
        let y = Int(year)!
        if y % 4 == 0 && y % 100 != 0 {
            leapYear = true
        } else if y % 400 == 0 {
            leapYear = true
        }
        
        return leapYear
    }
    
    /// 获取两日期天数差
    ///
    /// - Parameters:
    ///   - date1: 日期1
    ///   - date2: 日期2
    /// - Returns: 天数差
    class func getDifferDaysBetween(date1: String, date2:String) -> Int {
        if date1 == "" || date2 == "" {
            return 0
        }
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        let d1 = dateFormat.date(from: date1)
        let d2 = dateFormat.date(from: date2)
        
        let calendar = Calendar.current
        let diff = calendar.dateComponents([.day], from: d1!, to: d2!)
        
        return diff.day!
    }
	
	/// 获取今天到指定日期天数
	///
	/// - Parameter date: 指定日期
	/// - Returns: 天数差
	class func getDifferDaysTodayAnd(date: String) -> Int {
		if date == "" {
			return 0
		}
		
		let dateFormat = DateFormatter()
		dateFormat.dateFormat = "yyyy-MM-dd"
		
		let d1 = dateFormat.date(from: DateUtil.getCurDate())
		let d2 = dateFormat.date(from: date)
		
		let calendar = Calendar.current
		let diff = calendar.dateComponents([.day], from: d1!, to: d2!)
		
		return diff.day!
	}
	
    /// 将 "yyyy-MM-dd" 格式的日期换算成 Date
    ///
    /// - Parameter string: "yyyy-MM-dd" 格式的日期
    /// - Returns: Date 类型的日期
    class func dateFormString(_ string:String) -> Date{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat.date(from: string)!
    }
    
    
    /// 将 "yyyy-MM-dd" 格式的日期换算成数组 [yyyy, MM, dd], 方便使用
    ///
    /// - Parameter date: 目标日期
    /// - Returns: 日期数组
    class func dateToIntArray(_ date:String) -> [Int] {
        let dates = date.components(separatedBy: "-")
        if dates.count == 3 {
            let value = [Int(dates[0]), Int(dates[1]), Int(dates[2])]
            return value as! [Int]
        } else {
            return [0, 0, 0]
        }
    }
    
    /// 获取某年某月天书
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    /// - Returns: 天数
    class func getDaysIn(year:Int, month:Int) -> Int {
        let stringDate1 = "\(year)-\(month)-01"
        var stringDate2 = ""
        if month == 12 {
            stringDate2 = "\(year + 1)-01-01"
        } else {
            stringDate2 = "\(year)-\((month + 1))-01"
        }
        return getDifferDaysBetween(date1: stringDate1, date2: stringDate2)
    }
}
