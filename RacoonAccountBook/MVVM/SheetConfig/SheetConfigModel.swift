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
        shared.uuidOfExpenseToEdit = nil

        shared.expense_inputting = ExpenseInfo(spentAt: DateInRegion(region: regionChina), event: "", amount: 0)
        shared.amount_string_inputting = ""

        shared.showingMetaItemSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false

        shared.showingStory = false
        shared.showingForWho = false
    }

    // 是更新的情况
    func showEditSheet(itemIdToEdit: UUID, metadata: ExpenseInfo) {
        shared.isEditMode = true
        shared.uuidOfExpenseToEdit = itemIdToEdit

        shared.expense_inputting = metadata // 这个只是临时用的 给一个初值进去就行了
        shared.amount_string_inputting = String(String(format: "%.1f", metadata.amount))

        shared.showingMetaItemSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false

        shared.showingStory = metadata.story != nil
        shared.showingForWho = metadata.forWho.count != 0
    }
}
