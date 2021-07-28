import SwiftDate
import SwiftUI

struct OriginalTextField: View {
    var hint: String = ""
    @Binding var metadata_inputting: MetaItem

    @Binding var isEditing: Bool
    @Binding var amount_string_inputting: String

    var body: some View {
        TextField(
            hint,
            text: $metadata_inputting.originalText ?? "") { isEditing in
                self.isEditing = isEditing
        }
        onCommit: {
            printLog("[OriginalTextField] Committed")
            UpdateMetaItem()
        }
        // 注意这里最好不用`.onReceive` 因为`Just()`所认为的修改应该不仅仅有值上的改变 还有地址上的改变 好像一赋值就会执行 这并不是所期望的
        .onChange(of: metadata_inputting.originalText) { _ in
            printLog("[OriginalTextField] Changed.")
            UpdateMetaItem()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.default) // TODO: Check https://stackoverflow.com/a/67892400/14298786 to change submitLabel after iOS 15. Also there's a `.onSubmit()` in which you can do some operations.
    }

    private func UpdateMetaItem() {
        metadata_inputting.update(
            spentMoneyAt: OriginalText2SpentMoneyAt(from: metadata_inputting.originalText ?? "") ?? DateInRegion(region: regionChina),
            event: OriginalText2Event(from: metadata_inputting.originalText ?? "") ?? "",
            amount_float: OriginalText2Amount(from: metadata_inputting.originalText ?? "") ?? 0.0,
            generatedTags: OriginalText2GeneratedTags(from: metadata_inputting.originalText ?? ""))
        amount_string_inputting = String(metadata_inputting.amount_float)
    }
}
