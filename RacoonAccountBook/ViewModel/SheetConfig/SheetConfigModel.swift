// SheetConfigModel.swift

import Foundation
import SwiftUI
import SwiftDate

class SheetConfigModel: ObservableObject {
    // MARK: - Create Model

    @Published var shared = SheetConfigModel.newSheetConfig()

    private static func newSheetConfig() -> SheetConfig {
        return SheetConfig()
    }

//    // MARK: - Access to Data of Model
//
//    // MARK: - 显示的数据相关
//
//    /// 正在输入的MetaItem（临时）
//    ///
//    /// 添加：确定之后保存数据并清零
//    ///
//    /// 修改：确定之后更新数据
//    var metadata_inputting: MetaItem  = MetaItem(spentMoneyAt: DateInRegion(region:regionChina), event: "", amount_float: 0)
//
//    /// 用来转换输入的可能不是小数的小数（临时）
//    var amount_string_inputting: String {
//        get {
//            model.amount_string_inputting
//        }
//        set {
//            model.amount_string_inputting = newValue
//        }
//    }
//
//    // MARK: - 修改相关
//
//    var isEditMode: Bool {
//        get {
//            model.isEditMode
//        }
//        set {
//            model.isEditMode = newValue
//        }
//    }
//
//    /// 要修改的Item的id
//    var itemIdToEdit: Int {
//        get {
//            model.itemIdToEdit
//        }
//        set {
//            model.itemIdToEdit = newValue
//        }
//    }
//
//    // MARK: - 是否显示某视图
//
//    /// 是否正在显示添加账目的Sheet
//    var showingOrdinaryAddView: Bool {
//        get {
//            model.showingOrdinaryAddView
//        }
//        set {
//            model.showingOrdinaryAddView = newValue
//        }
//    }
//
//    /// 是否正在显示语音输入界面
//    var showingVoiceInputView: Bool {
//        get {
//            model.showingVoiceInputView
//        }
//        set {
//            model.showingVoiceInputView = newValue
//        }
//    }
//
//    /// 是否正在显示成功添加之后的提示
//    var showingSuccessfullyAlert: Bool {
//        get {
//            model.showingSuccessfullyAlert
//        }
//        set {
//            model.showingSuccessfullyAlert = newValue
//        }
//    }
//
//    // MARK: - 控制界面样式
//
//    /// 控制TabView模糊的程度，语音输入时模糊画面
//    var blurRadius: CGFloat {
//        get {
//            model.blurRadius
//        }
//        set {
//            model.blurRadius = newValue
//        }
//    }
//
//    // MARK: - 修改变量的值
}
