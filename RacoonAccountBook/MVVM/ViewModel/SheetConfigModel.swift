// SheetConfigModel.swift

import Foundation
import SwiftDate
import SwiftUI

class SheetConfigModel: ObservableObject {
    @Published var shared = SheetConfigModel.newSheetConfig()

    private static func newSheetConfig() -> SheetConfig {
        return SheetConfig()
    }

    // 是添加的情况 将数据都清除
    func addNewMetaItem() {
        shared.isEditMode = false
        shared.itemIdToEdit = 0

        shared.metadata_inputting = MetaItem(spentMoneyAt: DateInRegion(region: regionChina), event: "", amount_float: 0)
        shared.amount_string_inputting = ""

        shared.showingMetaItemSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false
    }
}
