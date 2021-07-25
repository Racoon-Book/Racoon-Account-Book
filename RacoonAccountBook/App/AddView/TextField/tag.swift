import SwiftUI

struct TagField: View {
    var hint: String = ""
    @State var input_text: String = ""
    @Binding var isEditing: Bool
    @Binding var metadata_inputting: MetaItem

    var body: some View {
        TextField(
            hint,
            text: $input_text) { isEditing in
            self.isEditing = isEditing
        } onCommit: {
            metadata_inputting.tags?.append(input_text)
            input_text = ""
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
