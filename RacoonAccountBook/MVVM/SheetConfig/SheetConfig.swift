// SheetConfig.swift

import Foundation
import SwiftDate
import SwiftUI

struct SheetConfig {
    // MARK: - 显示的数据相关

    /// 正在输入的MetaItem（临时）
    ///
    /// 添加：确定之后保存数据并清零
    ///
    /// 修改：确定之后更新数据
    var expense_inputting = ExpenseInfo(
        spentAt: DateInRegion(region: regionChina),
        event: "",
        amount: 0.0)
    /// 用来转换输入的可能不是小数的小数（临时）
    var amount_string_inputting: String = ""

    // MARK: - 修改相关

    /// 是否为修改某个Item的Sheet
    var isEditMode: Bool = false
    /// 要修改的Expense的uuid
    var uuidOfExpenseToEdit: UUID? = nil

    // MARK: - 是否显示某视图

    /// 是否正在显示添加账目的Sheet
    var showingMetaItemSheet: Bool = false
    /// 是否正在显示语音输入界面
    var showingVoiceInputView: Bool = false
    /// 是否正在显示成功添加之后的提示
    var showingSuccessfullyAlert: Bool = false

    // MARK: - 控制界面动态样式

    /// 控制TabView模糊的程度，语音输入时模糊画面
    var blurRadius: CGFloat = 0

    var showingStory: Bool = false
    var showingForWho: Bool = false
}
