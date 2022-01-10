// SheetConfigModel.swift

import Foundation
import SwiftDate
import SwiftUI

class SheetConfigModel: ObservableObject {
    @Published var shared = SheetConfigModel.newSheetConfig()

    private static func newSheetConfig() -> SheetConfig {
        SheetConfig()
    }

    // 是添加的情况 将数据都清除
    func showCreateSheet() {
        shared.isEditMode = false
        shared.uuidOfExpenseToEdit = nil

        shared.expense_inputting = ExpenseInfo(spentAtDate: Date(), event: "", amount: 0)
        shared.amount_string_inputting = ""

        shared.showingExpenseSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false

        shared.showingStory = false
        shared.showingForWho = false
    }

    // 是更新的情况
    func showEditSheet(uuidOfExpenseToEdit: UUID, expenseInfo: ExpenseInfo) {
        shared.isEditMode = true
        shared.uuidOfExpenseToEdit = uuidOfExpenseToEdit

        shared.expense_inputting = expenseInfo // 这个只是临时用的 给一个初值进去就行了
        shared.amount_string_inputting = String(String(format: "%.1f", expenseInfo.amount))

        shared.showingExpenseSheet = true

        shared.blurRadius = 0
        shared.showingSuccessfullyAlert = false
        shared.showingVoiceInputView = false

        shared.showingStory = expenseInfo.story != nil
        shared.showingForWho = expenseInfo.forWho.count != 0
    }
}
