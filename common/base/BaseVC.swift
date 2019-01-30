//
//  BaseVC.swift
//  teacher
//
//  Created by charles on 2018/10/26.
//  Copyright © 2018 charles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVKit

class BaseVC: UIViewController {
    
    //标识当前 toast 有没有在显示
    var toastShowing = false

    override func viewDidLoad() {
        super.viewDidLoad()

        /// 设置navigationBar透明并且没有分隔阴影
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        /// 标题白色
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]
        self.navigationController?.navigationBar.tintColor = ColorWhite
        // 返回按钮只有箭头
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
    }
    
    /// 返回登录界面
    private func toLogin() -> Void {
        
    }
    
    // MARK: - 提示
    /// 显示 toast 提示用户
    ///
    /// - Parameter msg: 提示内容
    func showToast(msg: String) -> Void {
        if toastShowing {
            return
        }
        toastShowing = true
        let toastView = Views.viewWith(color: UIColor.init(white: 0, alpha: 0.75))
        Views.addShadowOn(toastView, color: UIColor.black, opacity: 0.3, radius: 4, offset: CGSize.init(width: 0, height: 2), cornerRadius: 10)
        self.view.addSubview(toastView)
        toastView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-220)
        }
        
        let toastMsg = Views.lableWith(title: msg, color: UIColor.white, font: UIFont.systemFont(ofSize: 14))
        toastView.addSubview(toastMsg)
        toastMsg.lineBreakMode = .byCharWrapping
        toastMsg.numberOfLines = 0
        toastMsg.textAlignment = .center
        toastMsg.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20))
        }
        
        var p = toastView.center
        p.y -= 220
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            toastView.center = p
        }) { (Bool) in
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: {
                toastView.alpha = 0
                toastMsg.alpha = 0
            }, completion: { (Bool) in
                toastView.removeFromSuperview()
                toastMsg.removeFromSuperview()
                self.toastShowing = false
            })
        }
    }

}
