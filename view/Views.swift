//
//  Views.swift
//  teacher
//
//  Created by charles on 2018/10/25.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit
import SnapKit

class Views {
    //MARK: - view UIView
    
    /// 构造一个 UIView
    ///
    /// - Parameter color: color
    /// - Returns: UIView
    class func viewWith(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    /// 构造一个带阴影的白色 UIView
    ///
    /// - Parameter color: color
    /// - Returns: UIView
    class func viewWithShadow() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        
        //        let shadow = UIView()
        //        view.addSubview(shadow)
        //        shadow.backgroundColor = UIColor.init(white: 0, alpha: 0.05)
        //        shadow.snp.makeConstraints { (make) in
        //            make.height.equalTo(2)
        //            make.width.equalToSuperview()
        //            make.top.equalTo(view.snp.bottom)
        //        }
        
        return view
    }
    
    /// 构造一个带阴影的白色 UIView
    ///
    /// - Parameter color: color
    /// - Returns: UIView
    class func resetViewWithShadow(_ view:UIView) -> Void {
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
    }
    
    /// 改造一个 UIView
    ///
    /// - Parameter color: color
    class func resetView(_ view:UIView, color: UIColor) -> Void {
        view.backgroundColor = color
    }
    
    /// 构造一个带阴影的 UIView
    ///
    /// - Parameters:
    ///   - color: color
    ///   - shadowColor: shadowColor
    ///   - opacity: opacity
    ///   - radius: radius
    ///   - offset: offset
    /// - Returns: UIView
    class func viewWith(color: UIColor, shadowColor:UIColor, opacity: Float, radius:CGFloat, offset: CGSize) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = offset
        return view
    }
    
    
    /// 构造一个带阴影的 UIView，阴影颜色为黑色透明度为0.16
    ///
    /// - Parameters:
    ///   - color: color
    ///   - offsetX: offsetX
    ///   - offsetY: offsetY
    ///   - radius: radius
    /// - Returns:
    class func shadowViewWith(color: UIColor, radius: CGFloat, offsetX: Int, offsetY: Int, shadowRadius: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.cornerRadius = radius
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.16
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOffset = CGSize.init(width: offsetX, height: offsetY)
        return view
    }
    
    /// 改造一个带阴影的 UIView
    ///
    /// - Parameters:
    ///   - color: color
    ///   - shadowColor: shadowColor
    ///   - opacity: opacity
    ///   - radius: radius
    ///   - offset: offset
    class func resetView(_ view: UIView, color: UIColor, shadowColor:UIColor, opacity: Float, radius:CGFloat, offset: CGSize) -> Void {
        view.backgroundColor = color
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = offset
    }
    
    //MARK: - 文字 UILable
    
    /// 构造一个 UILable
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - font: font
    /// - Returns: UILable
    class func lableWith(title: String, color: UIColor, font: UIFont) -> UILabel {
        let lable = UILabel()
        lable.text = title
        lable.textColor = color
        lable.font = font
        return lable
    }
    
    /// 改造一个 UILable
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - font: font
    class func resetLable(_ lable: UILabel, title: String, color: UIColor, font: UIFont) -> Void {
        lable.text = title
        lable.textColor = color
        lable.font = font
    }
    
    //MARK: - 按钮 UIButton
    
    /// 构造一个 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - font: font
    /// - Returns: UIButton
    class func buttonWith(title: String, color: UIColor, font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = font
        return button
    }
    
    /// 改造一个 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - font: font
    class func resetButton(_ button: UIButton, title: String, color: UIColor, font: UIFont) -> Void {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = font
    }
    
    /// 构造一个有不可点击状态的 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - disableColor: disableColor
    ///   - font: font
    /// - Returns: UIButton
    class func buttonWith(title: String, color: UIColor, disableColor: UIColor, font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(disableColor, for: .disabled)
        button.titleLabel?.font = font
        return button
    }
    
    /// 构造一个有不可点击状态的 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - disableColor: disableColor
    ///   - font: font
    /// - Returns: UIButton
    class func buttonWith(title: String, disableTitle: String, color: UIColor, disableColor: UIColor, font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitle(disableTitle, for: .disabled)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(disableColor, for: .disabled)
        button.titleLabel?.font = font
        return button
    }
    
    /// 改造一个有不可点击状态的 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - disableColor: disableColor
    ///   - font: font
    class func resetButton(_ button: UIButton, title: String, color: UIColor, disableColor: UIColor, font: UIFont) -> Void {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(disableColor, for: .disabled)
        button.titleLabel?.font = font
    }
    
    /// 改造一个有不可点击状态的 UIButton
    ///
    /// - Parameters:
    ///   - title: title
    ///   - color: color
    ///   - disableColor: disableColor
    ///   - font: font
    class func resetButton(_ button: UIButton, title: String, disableTitle: String, color: UIColor, disableColor: UIColor, font: UIFont) -> Void {
        button.setTitle(title, for: .normal)
        button.setTitle(disableTitle, for: .disabled)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(disableColor, for: .disabled)
        button.titleLabel?.font = font
    }
    
    //MARK: - 阴影 shadow
    
    /// 为 view 加阴影
    ///
    /// - Parameters:
    ///   - view: 目标 view
    ///   - color: color
    ///   - opacity: opacity
    ///   - radius: radius
    ///   - offset: offset
    class func addShadowOn(_ view: UIView, color:UIColor, opacity: Float, radius:CGFloat, offset: CGSize, cornerRadius: CGFloat) -> Void {
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = offset
        view.layer.cornerRadius = cornerRadius
    }
    
    /// 为 view 添加阴影
    ///
    /// - Parameter view: 目标 view
    class func addShadowOn(_ view: UIView) -> Void {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
    }
    
    /// 添加边框
    ///
    /// - Parameters:
    ///   - view: 目标 view
    ///   - color: color
    ///   - width: width
    ///   - cornerRadius: cornerRadius
    class func addBorderOn(_ view:UIView, color:UIColor, width: CGFloat, cornerRadius: CGFloat) -> Void {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        view.layer.cornerRadius = cornerRadius
    }
    
    
    /// 图片
    ///
    /// - Parameter image: 图片名
    /// - Returns: 
    class func imageViewWith(image: String) -> UIImageView {
        return UIImageView.init(image: UIImage.init(named: image))
    }
}
