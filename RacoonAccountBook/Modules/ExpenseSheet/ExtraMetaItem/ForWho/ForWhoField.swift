import SwiftUI

struct ForWhoField: View {
    var hint: String = "这笔花销为某某"
    @State private var input_text: String = ""
    @Binding var expenseInfo_inputting: ExpenseInfo

    var body: some View {
        TextField(
            hint,
            text: $input_text
        ) { _ in }
        onCommit: {
            if input_text != "" {
                expenseInfo_inputting.forWho.append(input_text)
                input_text = ""
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 150)
        .padding([.horizontal], 4) // 这里的与`MultilineTagsView`保持一致
    }
}
