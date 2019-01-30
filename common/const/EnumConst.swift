//
//  EnumConst.swift
//  teacher
//
//  Created by charles on 2018/11/4.
//  Copyright © 2018 charles. All rights reserved.
//

import Foundation


/// 练习范围
///
/// - subject: 整个科目
/// - section: 整个节
/// - paper: 真题
enum ExerciseRange {
    case subject
    case section
    case paper
}


/// 练习题目类型
///
/// - all: 所有
/// - subjective: 主观题（非选择题）
/// - objective: 客观题（选择题）
enum ExerciseType: Int {
    case all
    case objective
    case subjective
}
