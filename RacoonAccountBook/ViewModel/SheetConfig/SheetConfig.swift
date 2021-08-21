// SheetConfig.swift

import Foundation
import SwiftUI

struct SheetConfig {
    // MARK: - 修改相关

    /// 是否为修改某个Item的Sheet
    var isEditMode: Bool = false
    /// 要修改的Item的id
    var itemIdToEdit: Int = 0

    // MARK: - 是否显示某视图

    /// 是否正在显示添加账目的Sheet
    var showingOrdinaryAddView: Bool = false
    /// 是否正在显示语音输入界面
    var showingVoiceInputView: Bool = false
    /// 是否正在显示成功添加之后的提示
    var showingSuccessfullyAlert: Bool = false

    // MARK: - 控制界面动态样式

    /// 控制TabView模糊的程度，语音输入时模糊画面
    var blurRadius: CGFloat = 0
}
