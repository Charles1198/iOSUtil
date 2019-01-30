//
//  MultiStatusView.swift
//  teacher
//
//  Created by yueji Jia on 2018/12/5.
//  Copyright © 2018年 charles. All rights reserved.
//

import UIKit
import Lottie

protocol MultiStatusViewDelegate {
	
	/// 网络未连接或网络连接错误时，点击“重试”按钮重新请求
	func  retryRequest()
}

class MultiStatusView: BaseView {
	var retryDelegate: MultiStatusViewDelegate?

	func emptyStatus()  {
		emptyStatusWith(message: "这里没有数据")
	}
	
	func emptyStatusWith(message: String) {
		let emptyAnimation = LOTAnimationView.init(name: "lottie_empty")
		emptyAnimation.loopAnimation = true
		self.addSubview(emptyAnimation)
		emptyAnimation.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		emptyAnimation.play()
		
		let messageLabel = UILabel()
		messageLabel.text = message
		messageLabel.textColor = ColorTextLight
		self.addSubview(messageLabel)
		messageLabel.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(emptyAnimation.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
	}
	
	func noNetworkStatus()  {
		emptyStatusWith(message: "网络已断开，请检查手机网络连接状态数据")
	}
	
	func noNetworkStatusWith(message: String) {
		let emptyAnimation = LOTAnimationView.init(name: "lottie_empty")
		emptyAnimation.loopAnimation = true
		self.addSubview(emptyAnimation)
		emptyAnimation.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		emptyAnimation.play()
		
		let messageLabel = UILabel()
		messageLabel.text = message
		messageLabel.textColor = ColorTextLight
		self.addSubview(messageLabel)
		messageLabel.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(emptyAnimation.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
		
		let retryBtn = UIButton()
		retryBtn.setTitle("点我重试", for: .normal)
		retryBtn.setTitleColor(ColorBtnBlue, for: .normal)
		retryBtn.addTarget(self, action: #selector(retry), for: .touchUpInside)
		self.addSubview(retryBtn)
		retryBtn.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(messageLabel.snp.bottom).offset(8)
		})
	}

	func errorStatus() {
		errorStatus(message: "服务器连接错误")
	}
	
	func errorStatus(message: String) {
		let errorAnimation = LOTAnimationView.init(name: "lottie_404")
		errorAnimation.loopAnimation = true
		self.addSubview(errorAnimation)
		errorAnimation.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		errorAnimation.play()
		
		let messageLabel = UILabel()
		messageLabel.text = message
		messageLabel.textColor = ColorTextLight
		self.addSubview(messageLabel)
		messageLabel.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(errorAnimation.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
		
		let retryBtn = UIButton()
		retryBtn.setTitle("点我重试", for: .normal)
		retryBtn.setTitleColor(ColorBtnBlue, for: .normal)
		retryBtn.addTarget(self, action: #selector(retry), for: .touchUpInside)
		self.addSubview(retryBtn)
		retryBtn.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(messageLabel.snp.bottom).offset(8)
		})
	}
	
	/// 点击“重试”按钮
	@objc func retry() {
		retryDelegate?.retryRequest()
	}
}
