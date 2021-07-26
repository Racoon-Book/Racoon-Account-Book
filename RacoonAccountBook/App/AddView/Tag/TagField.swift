import SwiftUI

struct TagField: View {
    var hint: String = ""
    @State var input_text: String = ""
    @Binding var metadata_inputting: MetaItem

    var body: some View {
        TextField(
            hint,
            text: $input_text) { _ in }
        onCommit: {
            if input_text != "" {
                metadata_inputting.tags.append(input_text)
                input_text = ""
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 120)
        .padding([.horizontal], 4) // 这里的与`MultilineTagsView`保持一致
    }
}
