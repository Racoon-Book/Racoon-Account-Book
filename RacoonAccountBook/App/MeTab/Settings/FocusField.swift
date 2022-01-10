import SwiftUI

struct FocusField: View {
    @Environment(\.managedObjectContext) private var context

    var hint: String = ""
    @State var input_text: String = ""

    var body: some View {
        TextField(
            hint,
            text: $input_text
        ) { _ in }
        onCommit: {
            if input_text != "" {
                Focus.focus(name: input_text, context: context) // 添加这个新的focus到数据库
                // TODO: 检测重复 重复了告诉用户重复了 添加成功有弹窗
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
