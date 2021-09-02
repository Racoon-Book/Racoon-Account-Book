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
    func showCreateSheet() {
        shared.isEditMode = false
        shared.itemIdToEdit = 0

        shared.metadata_inputting = MetaItem(spentMoneyAt: DateInRegion(region: regionChina), event: "", amount_float: 0)
        shared.amount_string_inputting = ""

        shared.showingMetaItemSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false
    }

    // 是更新的情况
    func showEditSheet(itemIdToEdit: Int, metadata: MetaItem) {
        shared.isEditMode = true
        shared.itemIdToEdit = itemIdToEdit

        shared.metadata_inputting = metadata // 这个只是临时用的 给一个初值进去就行了
        shared.amount_string_inputting = String(String(format: "%.1f", metadata.amount_float))

        shared.showingMetaItemSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false
    }
}
