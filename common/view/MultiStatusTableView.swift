//
//  MultiStatusTableView.swift
//  teacher
//
//  Created by yueji Jia on 2018/12/4.
//  Copyright © 2018年 charles. All rights reserved.
//

import UIKit
import Lottie

protocol MultiStatusTableViewDelegate {
	
	/// 网络未连接或网络连接错误时，点击“重试”按钮重新请求
	func  retryRequest()
}

class MultiStatusTableView: UITableView {
	var retryDelegate: MultiStatusTableViewDelegate?

	var loadingAnimation: LOTAnimationView?
	var emptyAnimation: LOTAnimationView?
	var errorAnimation: LOTAnimationView?
	var noNetworkAnimation: LOTAnimationView?
	
	var messageLabel: UILabel?
	var retryBtn: UIButton?
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init() {
		self.init(frame: CGRect.zero)
	}
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
	}
	
	func mReloadData() {
		self.reloadData()
		removeAll()
	}
	
	func startLoading() {
		removeAll()
		
		loadingAnimation = LOTAnimationView.init(name: "lottie_loading")
		loadingAnimation?.loopAnimation = true
		self.addSubview(loadingAnimation!)
		loadingAnimation?.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		loadingAnimation!.play()
	}
	
	func setEmptyStatus() {
		setEmptyStatus(message: "暂时没有数据")
	}
	
	func setEmptyStatus(message: String) {
		removeAll()
		
		emptyAnimation = LOTAnimationView.init(name: "lottie_empty")
		emptyAnimation?.loopAnimation = true
		self.addSubview(emptyAnimation!)
		emptyAnimation?.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		emptyAnimation!.play()
		
		messageLabel = UILabel()
		messageLabel?.text = message
		messageLabel?.textColor = ColorTextLight
		messageLabel?.textAlignment = .center
		self.addSubview(messageLabel!)
		messageLabel?.snp.makeConstraints({ (make) in
			make.top.equalTo(emptyAnimation!.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
	}
	
	func setErrorStatus() {
		setErrorStatus(message: "服务器连接错误")
	}
	
	func setErrorStatus(message: String) {
		removeAll()
		
		errorAnimation = LOTAnimationView.init(name: "lottie_404")
		errorAnimation?.loopAnimation = true
		self.addSubview(errorAnimation!)
		errorAnimation?.snp.makeConstraints({ (make) in
			make.width.height.equalTo(240)
			make.center.equalToSuperview()
		})
		errorAnimation!.play()
		
		messageLabel = UILabel()
		messageLabel?.text = message
		messageLabel?.textColor = ColorTextLight
		messageLabel?.textAlignment = .center
		self.addSubview(messageLabel!)
		messageLabel?.snp.makeConstraints({ (make) in
			make.top.equalTo(errorAnimation!.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
		
		retryBtn = UIButton()
		retryBtn?.setTitle("点我重试", for: .normal)
		retryBtn?.setTitleColor(ColorBtnBlue, for: .normal)
		retryBtn?.addTarget(self, action: #selector(retry), for: .touchUpInside)
		self.addSubview(retryBtn!)
		retryBtn?.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(messageLabel!.snp.bottom).offset(8)
		})
	}
	
	func setNoNetworkStatus() {
		setNoNetworkStatus(message: "网络已断开，请检查手机网络连接状态")
	}
	
	func setNoNetworkStatus(message: String) {
		removeAll()
		
		noNetworkAnimation = LOTAnimationView.init(name: "lottie_no_connection")
		self.addSubview(noNetworkAnimation!)
		noNetworkAnimation?.snp.makeConstraints({ (make) in
			make.width.height.equalTo(180)
			make.center.equalToSuperview()
		})
		noNetworkAnimation!.play()
		
		messageLabel = UILabel()
		messageLabel?.text = message
		messageLabel?.textColor = ColorTextLight
		messageLabel?.textAlignment = .center
		self.addSubview(messageLabel!)
		messageLabel?.snp.makeConstraints({ (make) in
			make.top.equalTo(noNetworkAnimation!.snp.bottom)
			make.left.equalToSuperview().offset(32)
			make.right.equalToSuperview().offset(-32)
		})
		
		retryBtn = UIButton()
		retryBtn?.setTitle("点我重试", for: .normal)
		retryBtn?.setTitleColor(ColorBtnBlue, for: .normal)
		retryBtn?.addTarget(self, action: #selector(retry), for: .touchUpInside)
		self.addSubview(retryBtn!)
		retryBtn?.snp.makeConstraints({ (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(messageLabel!.snp.bottom).offset(8)
		})
	}
	
	func removeAll() {
		if loadingAnimation != nil {
			loadingAnimation?.stop()
			loadingAnimation?.removeFromSuperview()
			loadingAnimation = nil
		}
		if emptyAnimation != nil {
			emptyAnimation?.stop()
			emptyAnimation?.removeFromSuperview()
			emptyAnimation = nil
		}
		if errorAnimation != nil {
			errorAnimation?.stop()
			errorAnimation?.removeFromSuperview()
			errorAnimation = nil
		}
		if noNetworkAnimation != nil {
			noNetworkAnimation?.stop()
			noNetworkAnimation?.removeFromSuperview()
			noNetworkAnimation = nil
		}
		if messageLabel != nil {
			messageLabel?.removeFromSuperview()
			messageLabel = nil
		}
		if retryBtn != nil {
			retryBtn?.removeFromSuperview()
			retryBtn = nil
		}
	}
	
	/// 点击“重试”按钮
	@objc func retry() {
		retryDelegate?.retryRequest()
	}
}
