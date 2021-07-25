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
        } onCommit: {
            printLog("[OriginalTextField] Commit")
            UpdateMetaItem()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    func UpdateMetaItem() {
        metadata_inputting.amount_float = OriginalText2Amount(
            from: metadata_inputting.originalText ?? "") ?? 0.0
        amount_string_inputting = String(metadata_inputting.amount_float)

        metadata_inputting.event = OriginalText2Event(
            from: metadata_inputting.originalText ?? "") ?? ""
        metadata_inputting.generatedTags = OriginalText2GeneratedTags(
            from: metadata_inputting.originalText ?? "")
    }
}
