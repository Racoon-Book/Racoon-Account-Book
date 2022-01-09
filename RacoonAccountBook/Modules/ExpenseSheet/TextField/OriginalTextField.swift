import SwiftDate
import SwiftUI

struct OriginalTextField: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    var hint: String = ""

    @Binding var isEditing: Bool

    @Binding var expenseInfo_inputting: ExpenseInfo
    @Binding var amount_string_inputting: String

    var body: some View {
        TextField(
            hint,
            text: $expenseInfo_inputting.originalText ?? ""
        ) { isEditing in
            self.isEditing = isEditing
        }
        onCommit: {
            UpdateExpenseInfo()
        }
        // 注意这里最好不用`.onReceive` 因为`Just()`所认为的修改应该不仅仅有值上的改变 还有地址上的改变 好像一赋值就会执行 这并不是所期望的
        .onChange(of: expenseInfo_inputting.originalText) { _ in
            UpdateExpenseInfo()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.default) // TODO: Check https://stackoverflow.com/a/67892400/14298786 to change submitLabel after iOS 15. Also there's a `.onSubmit()` in which you can do some operations.
    }

    private func UpdateExpenseInfo() {
        // 是编辑模式则创建日期不变
        let spentMoneyAt: Date = RacoonSheetConfig.shared.isEditMode ?
            expenseInfo_inputting.spentAtDate :
            OriginalText2SpentMoneyAt(from: expenseInfo_inputting.originalText ?? "") ?? Date()

        expenseInfo_inputting.update(
            spentMoneyAt: spentMoneyAt,
            event: OriginalText2Event(from: expenseInfo_inputting.originalText ?? "") ?? "",
            amount_float: OriginalText2Amount(from: expenseInfo_inputting.originalText ?? "") ?? 0.0,
            generatedTags: OriginalText2GeneratedTags(from: expenseInfo_inputting.originalText ?? "")
        )
        amount_string_inputting = String(expenseInfo_inputting.amount)
    }
}
