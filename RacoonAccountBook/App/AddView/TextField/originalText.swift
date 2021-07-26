import Combine
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
        // Check https://stackoverflow.com/a/63694929/14298786
        // 解决用户可能在输入之后不按键盘上的回车直接点击添加按钮而未添加的问题
        .onReceive(Just(metadata_inputting.originalText)) { _ in
            printLog("[OriginalTextField] Changed.")
            UpdateMetaItem()
        }

        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    private func UpdateMetaItem() {
        metadata_inputting.update(
            event: OriginalText2Event(from: metadata_inputting.originalText ?? "") ?? "",
            amount_float: OriginalText2Amount(from: metadata_inputting.originalText ?? "") ?? 0.0,
            generatedTags: OriginalText2GeneratedTags(from: metadata_inputting.originalText ?? ""))
        amount_string_inputting = String(metadata_inputting.amount_float)
    }
}
