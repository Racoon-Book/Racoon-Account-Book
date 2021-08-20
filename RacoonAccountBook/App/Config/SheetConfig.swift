// SheetConfig.swift

import Foundation
import SwiftUI

struct SheetConfig {
    /// 是否正在显示添加账目的Sheet
    var isShowingOrdinaryAddView: Bool = false
    /// 是否正在显示语音输入界面
    var isShowingVoiceInputView: Bool = false
    /// 是否正在显示成功添加之后的提示
    var showAddSuccessfullyAlert: Bool = false
    /// 控制TabView模糊的程度，语音输入时模糊画面
    var blurRadius: CGFloat = 0
}
