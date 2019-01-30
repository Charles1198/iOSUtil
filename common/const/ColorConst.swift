//
//  ColorConst.swift
//  teacher
//
//  Created by charles on 2018/10/25.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit

let ColorGradientBlue = "#5AC7BC"
let ColorGradientGreen = "#61A3E0"

let ColorBg = UIColor(red: 246 / 255.0, green: 246 / 255.0, blue: 246 / 255.0, alpha: 1.0)
let ColorBlue = UIColor(red: 100 / 255.0, green: 149 / 255.0, blue: 237 / 255.0, alpha: 1.0)
let ColorWhite = UIColor.white
let ColorBlack = UIColor.black
let ColorShadowGray = UIColor(red: 216 / 255.0, green: 216 / 255.0, blue: 216 / 255.0, alpha: 1.0)

let ColorTextBlack = UIColor.black
let ColorTextDark = UIColor(red: 40 / 255.0, green: 40 / 255.0, blue: 40 / 255.0, alpha: 1.0)
let ColorText = UIColor(red: 40 / 255.0, green: 40 / 255.0, blue: 40 / 255.0, alpha: 1.0)
let ColorTextGray = UIColor(red: 80 / 255.0, green: 80 / 255.0, blue: 80 / 255.0, alpha: 1.0)
let ColorTextLight = UIColor(red: 120 / 255.0, green: 120 / 255.0, blue: 120 / 255.0, alpha: 1.0)

let ColorBtnBlue = UIColor(red: 100 / 255.0, green: 149 / 255.0, blue: 237 / 255.0, alpha: 1.0)
let ColorBtnGray = UIColor(red: 120 / 255.0, green: 120 / 255.0, blue: 120 / 255.0, alpha: 1.0)

func UIColorInHex(_ hexString : String) ->UIColor{
    let string = hexString as NSString
    var aStr = String.init()
    var rStr = String.init()
    var gStr = String.init()
    var bStr = String.init()
    
    //hexString -> #aarrggbb
    if string.length == 9 {
        aStr = string.substring(with: NSRange(location: 1,length: 2))
        rStr = string.substring(with: NSRange(location: 3,length: 2))
        gStr = string.substring(with: NSRange(location: 5,length: 2))
        bStr = string.substring(with: NSRange(location: 7,length: 2))
    }
    //hexString -> #rrggbb
    if string.length == 7 {
        aStr = "255"
        rStr = string.substring(with: NSRange(location: 1,length: 2))
        gStr = string.substring(with: NSRange(location: 3,length: 2))
        bStr = string.substring(with: NSRange(location: 5,length: 2))
    }
    //hexString -> #argb
    if string.length == 5 {
        aStr = string.substring(with: NSRange(location: 1,length: 1))
        rStr = string.substring(with: NSRange(location: 2,length: 1))
        gStr = string.substring(with: NSRange(location: 3,length: 1))
        bStr = string.substring(with: NSRange(location: 4,length: 1))
    }
    //hexString -> #rgb
    if string.length == 4 {
        aStr = "255"
        rStr = string.substring(with: NSRange(location: 1,length: 1))
        gStr = string.substring(with: NSRange(location: 2,length: 1))
        bStr = string.substring(with: NSRange(location: 3,length: 1))
    }
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0, a:CUnsignedInt = 0;
    Scanner(string: aStr).scanHexInt32(&a)
    Scanner(string: rStr).scanHexInt32(&r)
    Scanner(string: gStr).scanHexInt32(&g)
    Scanner(string: bStr).scanHexInt32(&b)
    
    let af = Float(a) / 255.0
    let rf = Float(r) / 255.0
    let gf = Float(g) / 255.0
    let bf = Float(b) / 255.0
    
    return UIColor(red: CGFloat(rf), green: CGFloat(gf), blue: CGFloat(bf), alpha: CGFloat(af))
}
