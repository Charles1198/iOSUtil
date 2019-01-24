//
//  IOUtil.swift
//  teacher
//
//  Created by charles on 2018/11/16.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit

class IOUtil {
    /// 检查文件是否存在
    ///
    /// - Parameter name: 文件名
    /// - Returns: 是否存在
    class func hasFile(name: String) -> Bool {
        let fileManager = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        return fileManager.fileExists(atPath: fileName)
    }
    
    /// 保存图片
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - name: 图片名
    class func saveImage(_ image: UIImage, name: String, qulity: Float) -> Void {
        if IOUtil.hasFile(name: name) {
            IOUtil.deleteFile(name)
        }
        //获取路径
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        let imageData = image.jpegData(compressionQuality: CGFloat(qulity))
        do {
            try imageData!.write(to: URL.init(string: fileName)! , options: .atomic)
        } catch {
            
        }
    }
    
    /// 获取图片
    ///
    /// - Parameter name: 图片名
    /// - Returns: 目标图片
    class func readImage(_ name:String) -> UIImage {
        //获取路径
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        let image = UIImage.init(contentsOfFile: fileName)
        if image != nil {
            return image!
        } else {
            return UIImage.init()
        }
    }
    
    
    /// 保存字符串
    ///
    /// - Parameters:
    ///   - string: 需要保存的字符串
    ///   - name: 文件名
    class func saveString(_ string:String, name:String) -> Void {
        if IOUtil.hasFile(name: name) {
            IOUtil.deleteFile(name)
        }
        //获取路径
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        do {
            try string.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to: \(fileName), Error: " + error.localizedDescription)
        }
    }
    
    
    /// 读取字符串
    ///
    /// - Parameter name: 文件名
    /// - Returns: 目标字符串
    class func readString(_ name:String) -> String {
        if !IOUtil.hasFile(name: name) {
            return ""
        }
        
        //获取路径
        //获取路径
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        let string = try? String(contentsOfFile: fileName, encoding: .utf8)
        return string!
    }
    
    /// 删除文件
    ///
    /// - Parameter name: 文件名
    class func deleteFile(_ name:String) -> Void {
        let fileManager  = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let directory = path[0]
        let fileName = directory + "/" + name
        
        do {
            try fileManager.removeItem(atPath: fileName)
        } catch let error as NSError {
            print("Failed delete file: \(fileName), Error: " + error.localizedDescription)
        }
    }
    
    
    /// 获取总内存大小
    ///
    /// - Returns: 内存大小，单位MB
    func totalMemory() -> Int {
        let memoryInBytes = ProcessInfo.processInfo.physicalMemory
        return Int(memoryInBytes / 1024 / 1024)
    }
}
