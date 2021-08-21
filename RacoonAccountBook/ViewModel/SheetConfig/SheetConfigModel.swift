// SheetConfigModel.swift

import Foundation
import SwiftUI

class SheetConfigModel: ObservableObject {
    // MARK: - Create Model

    @Published private var model = SheetConfigModel.newSheetConfig()

    private static func newSheetConfig() -> SheetConfig {
        return SheetConfig()
    }

    // MARK: - Access to Data of Model

    // MARK: - 是否显示某视图

    /// 是否正在显示添加账目的Sheet
    var showingOrdinaryAddView: Bool {
        get {
            model.showingOrdinaryAddView
        }
        set {
            model.showingOrdinaryAddView = newValue
        }
    }

    /// 是否正在显示语音输入界面
    var showingVoiceInputView: Bool {
        get {
            model.showingVoiceInputView
        }
        set {
            model.showingVoiceInputView = newValue
        }
    }

    /// 是否正在显示成功添加之后的提示
    var showingSuccessfullyAlert: Bool {
        get {
            model.showingSuccessfullyAlert
        }
        set {
            model.showingVoiceInputView = newValue
        }
    }

    // MARK: - 控制界面样式

    /// 控制TabView模糊的程度，语音输入时模糊画面
    var blurRadius: CGFloat {
        get {
            model.blurRadius
        }
        set {
            model.blurRadius = newValue
        }
    }

    // MARK: - 修改变量的值
}
