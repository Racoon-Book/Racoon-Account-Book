import SwiftUI

struct ExpenseInfoCommomTextField: View {
    var hint: String = ""

    @Binding var input_text: String
    @Binding var isEditing: Bool

    var body: some View {
        TextField(
            hint,
            text: $input_text
        ) { isEditing in
            self.isEditing = isEditing
        } onCommit: {}
            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
