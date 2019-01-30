//
//  BaseView.swift
//  teacher
//
//  Created by yueji Jia on 2018/12/5.
//  Copyright © 2018年 charles. All rights reserved.
//

import UIKit

class BaseView: UIView {

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init() {
		self.init(frame: CGRect.zero)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initView()
	}
	
	// MARK: - view
	
	func initView() {
	}
}
